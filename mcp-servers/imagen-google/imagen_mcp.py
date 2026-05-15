from mcp.server.fastmcp import FastMCP
from google import genai
from google.genai import types
import os

mcp = FastMCP("imagen-google")
client = genai.Client(api_key=os.environ["GEMINI_API_KEY"])

MODELS = {
    "imagen4": "imagen-4.0-generate-preview-05-20",
    "imagen3": "imagen-3.0-generate-002",
}

EDIT_MODEL = "imagen-3.0-capability-001"


@mcp.tool()
def generate_image(
    prompt: str,
    filename: str = "output.png",
    model: str = "imagen4",
    number_of_images: int = 1,
    aspect_ratio: str = "1:1",
    reference_image_path: str = "",
) -> str:
    """
    Genera una imagen con Google Imagen.

    Args:
        prompt: Descripción de la imagen a generar.
        filename: Nombre del archivo de salida (debe terminar en .png).
        model: "imagen4" (por defecto) o "imagen3". Ignorado si se usa reference_image_path.
        number_of_images: Número de imágenes a generar (1-4).
        aspect_ratio: "1:1", "16:9", "9:16", "4:3", "3:4".
        reference_image_path: Ruta a una imagen de referencia de estilo (opcional).
                              Cuando se provee, usa edit_image con EDIT_MODE_STYLE.
    """
    if reference_image_path:
        with open(os.path.expanduser(reference_image_path), "rb") as f:
            image_bytes = f.read()

        ref_image = types.StyleReferenceImage(
            referenceId=1,
            referenceImage=types.Image(image_bytes=image_bytes),
            config=types.StyleReferenceConfig(styleDescription=""),
        )

        response = client.models.edit_image(
            model=EDIT_MODEL,
            prompt=prompt,
            reference_images=[ref_image],
            config=types.EditImageConfig(
                number_of_images=number_of_images,
                aspect_ratio=aspect_ratio,
                edit_mode=types.EditMode.EDIT_MODE_STYLE,
            ),
        )
    else:
        model_id = MODELS.get(model, MODELS["imagen4"])
        response = client.models.generate_images(
            model=model_id,
            prompt=prompt,
            config=types.GenerateImagesConfig(
                number_of_images=number_of_images,
                aspect_ratio=aspect_ratio,
            ),
        )

    saved = []
    for i, img in enumerate(response.generated_images):
        name = filename if number_of_images == 1 else filename.replace(".png", f"-{i+1}.png")
        path = os.path.join(os.path.expanduser("~/Downloads"), name)
        with open(path, "wb") as f:
            f.write(img.image.image_bytes)
        saved.append(path)

    return f"{'Imagen guardada' if len(saved) == 1 else 'Imágenes guardadas'}: {', '.join(saved)}"


if __name__ == "__main__":
    mcp.run()
