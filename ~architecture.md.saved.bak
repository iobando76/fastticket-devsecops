# FastTicket / PeruFest - Arquitectura DevSecOps propuesta

```mermaid
flowchart LR
    A[1. CODE\nUnit tests + lint + build] -->|Gate: cobertura >= 80%| B[2. BUILD & SCA\nDocker build + Trivy FS/Image]
    B -->|Gate: 0 CVE High/Critical| C[3. SAST\nSemgrep]
    C -->|Gate: 0 hallazgos High| D[4. DEPLOY STAGING\nDocker Compose en GitHub Actions]
    D -->|Gate: app y API saludables| E[5. TEST & DAST\nSmoke tests + ZAP Baseline]
    E -->|Gate: 0 fallos funcionales\n0 DAST Medium/High| F[6. HARDENING FINAL\nTrivy Config + checks K8s]
    F -->|Gate: políticas y manifests seguros| G[7. DEPLOY PROD\nPromoción simulada + artifact release]

    H[(GitHub Actions Runner)] -. ejecuta .-> A
    H -. ejecuta .-> D
    I[(MongoDB en CI)] -. staging .-> D
    J[(K8s manifests hardened)] -. validados en .-> F
```

## Herramientas por función

- **Orquestación CI/CD:** GitHub Actions.
- **SCA/CVE:** Trivy sobre filesystem e imágenes Docker.
- **SAST:** Semgrep con reglas Node.js, JavaScript, secretos y Kubernetes.
- **DAST:** OWASP ZAP Baseline sobre el frontend desplegado en staging.
- **Hardening contenedores / IaC:** Dockerfiles no-root + Trivy config sobre manifests K8s.

## Decisión clave

El deploy a producción se **simula** dentro de GitHub Actions porque no hay AWS/Azure disponibles. El valor académico se conserva promoviendo el mismo bundle ya escaneado y aplicando una aprobación manual vía **GitHub Environment `production`**.
