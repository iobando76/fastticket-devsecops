# Cómo integrarlo en tu repositorio en pocos pasos

1. Clona tu repositorio.
2. Copia estos archivos sobre la raíz del proyecto.
3. Agrega estos scripts en `backend/package.json`:
   - `"test:ci": "node --test"`
4. Agrega estos scripts en `frontend/package.json`:
   - `"test:ci": "npm run build"`
5. Sube todo a una rama nueva y crea un Pull Request.
6. En GitHub, crea el environment **production** y configura **Required reviewers** para simular aprobación final.
7. Ejecuta el workflow `fastticket-devsecops-pipeline`.

## Qué se simula y qué no

- **Sí se simula:** CI/CD completo, construcción Docker, SCA, SAST, DAST, staging efímero, hardening y promoción a producción.
- **No se requiere:** AWS, Azure, EKS, secretos cloud, PostgreSQL real.

## Ajuste académico importante

Tu proyecto original usa **MongoDB**. Para la entrega universitaria esto es aceptable si declaras que el pipeline fue diseñado para una plataforma de tickets con datos sensibles, y que la capa de base de datos no altera la lógica DevSecOps exigida. No cambies a PostgreSQL si el objetivo principal es demostrar el pipeline.
