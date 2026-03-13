# A Processing and Visualization Workflow for IFC-Based BIM Models Towards Web-Based Digital Twin Applications

![Project Status](https://img.shields.io/badge/Status-Active-success)
![Docker Supported](https://img.shields.io/badge/Docker-Ready-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## Descripción General

Este repositorio contiene el prototipo y la arquitectura de pruebas para el desarrollo de un flujo de trabajo enfocado en el procesamiento y visualización de modelos BIM en formato **IFC** (Industry Foundation Classes) directamente en el navegador. 

El objetivo principal de esta aplicación es servir como base para el desarrollo de aplicaciones web orientadas a **Gemelos Digitales (Digital Twins)** en los sectores AEC (Arquitectura, Ingeniería y Construcción), integrando datos geométricos, sensores IoT, y métricas de rendimiento en un visor interactivo 3D.

---

## Características Principales

- **Visor 3D en el Navegador**: Carga y renderizado de archivos `.ifc` sin necesidad de *plugins* externos.
- **Árbol de Modelo (Model Tree)**: Estructura jerárquica de elementos espaciales (Sitio, Edificio, Plantas, Elementos) interactiva.
- **Integración de Sensores IoT (Simulados)**: Visualización de datos dinámicos como temperatura y humedad a través de un panel de métricas en tiempo real y visualizaciones tipo *Heatmap* sobre el modelo 3D.
- **Herramientas de Medición y Corte**: Distancias, ángulos, áreas, y planos de sección interactivos para el análisis del modelo integrado.
- **Entorno Optimizado "Pro"**: Listo para producción utilizando contenedores Docker con compilación multi-etapa (Node + Nginx).

---

## Tecnologías Utilizadas

### Frontend
- **HTML5, CSS3, JavaScript (ES6+)**
- **Three.js** (Motor de renderizado 3D subyacente)
- **IFC.js / OBC (Open BIM Components)** para el parseo y renderizado de geometría IFC.

### Despliegue (Docker)
- **Node.js (18 Alpine)**: Para el proceso de construcción (*build*).
- **Nginx (Alpine)**: Servidor web ligero para servir los archivos estáticos en producción.
- **Docker & Docker Compose**.

---

## Instrucciones de Instalación y Despliegue

La forma más sencilla de ejecutar esta aplicación es mediante **Docker**, lo cual garantiza un entorno idéntico en desarrollo y producción.

### Prerrequisitos
- Tener instalado [Docker](https://docs.docker.com/get-docker/) y [Docker Compose](https://docs.docker.com/compose/install/).

### Pasos

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/Jodavecu/AProcessingandVisualizationWorkflowforIFC-BasedBIMModelsTowardsWebBasedDigitalTwinApplications_JDVC.git
   cd AProcessingandVisualizationWorkflowforIFC-BasedBIMModelsTowardsWebBasedDigitalTwinApplications_JDVC
   ```

2. **Levantar el entorno con Docker Compose:**
   ```bash
   docker-compose up -d --build
   ```
   *El parámetro `--build` asegura que se construya la imagen más reciente, y `-d` ejecuta el contenedor en segundo plano.*

3. **Acceder a la aplicación:**
   Abre tu navegador de preferencia y dirígete a:
   [http://localhost:8080](http://localhost:8080)

4. **Para detener la aplicación:**
   ```bash
   docker-compose down
   ```

---

## Entorno Local (Desarrollo sin Docker)

Si prefieres realizar cambios y necesitas recarga en caliente (*hot-reload*):

1. Instala las dependencias:
   ```bash
   npm install
   ```

2. Ejecuta el servidor de desarrollo:
   ```bash
   npm run dev
   ```

3. El servidor iniciará normalmente en `http://localhost:5173` (dependiendo si usas Vite u otra herramienta) o según la configuración de tu `package.json`.

---

## Trabajo Futuro

- [ ] Integración con APIs de sensores reales.
- [ ] Optimización de carga de modelos masivos (LODs dinámicos).
- [ ] Capacidades colaborativas en tiempo real (anotaciones compartidas).

## Contacto

Jodavecu - Investigación y Desarrollo
