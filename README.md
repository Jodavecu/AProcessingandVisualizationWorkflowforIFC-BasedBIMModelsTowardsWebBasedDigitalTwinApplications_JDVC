# A Processing and Visualization Workflow for IFC-Based BIM Models Towards Web-Based Digital Twin Applications

![Project Status](https://img.shields.io/badge/Status-Active-success)
![Docker Supported](https://img.shields.io/badge/Docker-Ready-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## Overview

This repository contains the prototype and testing architecture for developing a workflow focused on the processing and visualization of BIM models in **IFC** (Industry Foundation Classes) format directly in the web browser.

The main objective of this application is to serve as a foundation for developing **Digital Twin** oriented web applications in the AEC (Architecture, Engineering, and Construction) sectors, integrating geometric data, IoT sensors, and performance metrics into an interactive 3D viewer.

---

## Key Features

- **In-Browser 3D Viewer**: Loading and rendering of `.ifc` files without the need for external plugins.
- **Model Tree**: Interactive hierarchical structure of spatial elements (Site, Building, Storeys, Elements).
- **IoT Sensor Integration (Simulated)**: Visualization of dynamic data such as temperature and humidity through a real-time metrics dashboard and Heatmap visualizations over the 3D model.
- **Measurement and Clipping Tools**: Interactive distances, angles, areas, and section planes for integrated model analysis.
- **Optimized "Pro" Environment**: Production-ready using Docker containers with multi-stage builds (Node + Nginx).

---

## Technologies Used

### Frontend
- **HTML5, CSS3, JavaScript (ES6+)**
- **Three.js** (Underlying 3D rendering engine)
- **IFC.js / OBC (Open BIM Components)** for parsing and rendering IFC geometry.

### Deployment (Docker)
- **Node.js (18 Alpine)**: For the build process.
- **Nginx (Alpine)**: Lightweight web server to serve static files in production.
- **Docker & Docker Compose**.

---

## Installation and Deployment Instructions

The easiest way to run this application is using **Docker**, which guarantees an identical environment in development and production.

### Prerequisites
- Have [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Jodavecu/AProcessingandVisualizationWorkflowforIFC-BasedBIMModelsTowardsWebBasedDigitalTwinApplications_JDVC.git
   cd AProcessingandVisualizationWorkflowforIFC-BasedBIMModelsTowardsWebBasedDigitalTwinApplications_JDVC
   ```

2. **Start the environment with Docker Compose:**
   ```bash
   docker-compose up -d --build
   ```
   *The `--build` parameter ensures the latest image is built, and `-d` runs the container in the background.*

3. **Access the application:**
   Open your preferred browser and go to:
   [http://localhost:8080](http://localhost:8080)

4. **To stop the application:**
   ```bash
   docker-compose down
   ```

---

## Local Environment (Development without Docker)

If you prefer to make changes and need hot-reloading:

1. Install dependencies:
   ```bash
   npm install
   ```

2. Run the development server:
   ```bash
   npm run dev
   ```

3. The server will normally start on `http://localhost:5173` (depending on if you use Vite or another tool) or according to your `package.json` configuration.

---

## Future Work

- [ ] Integration with real sensor APIs.
- [ ] Optimization for loading massive models (Dynamic LODs).
- [ ] Real-time collaborative capabilities (shared annotations).

## Contact

Jodavecu - Research and Development
