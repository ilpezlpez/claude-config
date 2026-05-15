// Ejemplo de implementación de un skill

interface SkillOptions {
  param1?: string;
  param2?: boolean;
}

export function ejemploSkill(options: SkillOptions = {}) {
  const { param1 = 'default', param2 = false } = options;

  console.log('Ejecutando ejemplo-skill');
  console.log(`Parámetro 1: ${param1}`);
  console.log(`Parámetro 2: ${param2}`);

  return {
    success: true,
    message: 'Skill ejecutado correctamente',
    data: { param1, param2 }
  };
}

export default ejemploSkill;
