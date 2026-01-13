<h2 align="center">
  <img src="https://slackmojis.com/emojis/21387-paw_prints/download" width="28" />
  Sistema de gestión de adopción de animales
  <img src="https://slackmojis.com/emojis/21387-paw_prints/download" width="28" />
</h2>

<p align="center">
  <b>Proyecto SQL · Enfoque QA / Testing</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL-MySQL-blue"/>
  <img src="https://img.shields.io/badge/QA-Testing-green"/>
  <img src="https://img.shields.io/badge/Status-Completed-success"/>
  <img src="https://img.shields.io/badge/Level-Intermediate-yellow"/>
</p>

---

<h2>
  <img src="https://slackmojis.com/emojis/42735-edit_document/download" 
       alt="edit document emoji" style="height: 1em; vertical-align: text-bottom;" />
  Descripción general
</h2>

Este repositorio contiene un proyecto de **base de datos relacional** diseñado para gestionar el proceso completo de adopción de animales rescatados.

El proyecto fue desarrollado con un **enfoque QA**, priorizando:
- Integridad de los datos  
- Validación de reglas de negocio  
- Detección de inconsistencias mediante consultas SQL  

Simula un sistema real, similar a los utilizados por refugios y organizaciones de adopción.

---

## <img src="https://slackmojis.com/emojis/60743-sparkling-heart/download" width="24" /> Objetivo del proyecto

Diseñar e implementar una base de datos que permita:

- 🐶 Registrar animales rescatados  
- 🏠 Gestionar refugios  
- 🙋‍♀️ Administrar adoptantes  
- 📝 Gestionar solicitudes de adopción  
- 🩺 Registrar controles veterinarios  
- 📦 Realizar seguimiento post adopción  
- 💰 Registrar donaciones  

---

## <img src="https://slackmojis.com/emojis/6843-blob_detective/download" width="24" /> Modelo de datos (lógico)

La base de datos está compuesta por múltiples tablas relacionadas mediante **claves primarias y foráneas**, asegurando la integridad referencial.

### Principales entidades

| Entidad | Descripción |
|------|------------|
| animales | Información de los animales rescatados |
| especies | Tipos de especies |
| razas | Razas asociadas a cada especie |
| refugios | Refugios disponibles |
| voluntarios | Personas que colaboran |
| veterinarios | Profesionales veterinarios |
| controles_veterinarios | Historial médico |
| adoptantes | Personas interesadas en adoptar |
| solicitudes_adopcion | Solicitudes de adopción |
| seguimiento_adopcion | Seguimiento posterior |
| donaciones | Donaciones recibidas |

---

## <img src="https://slackmojis.com/emojis/4439-mysql/download" width="24" /> Consultas SQL incluidas

### Consultas básicas
- Búsqueda por ID
- Búsqueda por nombre
- Uso de `LIKE`
- Listados generales

### Consultas intermedias
- Consultas con `JOIN`
- Filtros por estado
- Relaciones entre animales, refugios y adoptantes

### Consultas avanzadas (enfoque QA)
- Animales sin controles veterinarios
- Solicitudes aprobadas sin seguimiento
- Estados inconsistentes entre animales y solicitudes
- Adoptantes sin solicitudes asociadas
- Registros incompletos o inválidos

---

## <img src="https://slackmojis.com/emojis/14336-debug/download" width="24" /> Enfoque QA / Testing

El proyecto está pensado desde la perspectiva de **testing de bases de datos**, incluyendo consultas para validar:

| Validación | Descripción |
|---------|------------|
| Integridad referencial | Relaciones correctas entre tablas |
| Reglas de negocio | Estados válidos del proceso |
| Consistencia de datos | Información coherente |
| Casos negativos | Datos faltantes o incorrectos |

---

## <img src="https://slackmojis.com/emojis/67503-slack_notification/download" width="24" /> Tecnologías utilizadas

| Tecnología | Uso |
|----------|----|
| SQL | Lenguaje principal |
| MySQL | Motor de base de datos |
| VS Code | Edición del proyecto |
| Git | Control de versiones |
| GitHub | Repositorio remoto |

---

## <img src="https://slackmojis.com/emojis/60794-alien/download" width="24" /> Cómo ejecutar el proyecto

1. Abrir el script SQL  
2. Crear la base de datos  
3. Ejecutar `USE nombre_base;`  
4. Crear las tablas  
5. Insertar los datos  
6. Ejecutar las consultas de validación  

El script puede ejecutarse completo sin errores.

---

## <img src="https://slackmojis.com/emojis/62008-party-github/download" width="24" /> Cómo subir el proyecto a GitHub

### Pasos básicos

| Paso | Acción |
|----|------|
| 1 | Crear un repositorio en GitHub |
| 2 | Abrir el proyecto en VS Code |
| 3 | Inicializar Git (`git init`) |
| 4 | Agregar archivos (`git add .`) |
| 5 | Commit (`git commit -m "Initial commit"`) |
| 6 | Conectar repo remoto |
| 7 | Push a GitHub |

### Comandos usados

```bash
git init
git add .
git commit -m "Initial project"
git branch -M main
git remote add origin URL_DEL_REPO
git pull origin main --allow-unrelated-histories
git push -u origin main