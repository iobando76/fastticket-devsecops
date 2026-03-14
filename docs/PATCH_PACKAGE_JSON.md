# Cambios mínimos sugeridos en `package.json`

## backend/package.json

```json
{
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js",
    "test:ci": "node --test"
  }
}
```

## frontend/package.json

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "lint": "eslint .",
    "preview": "vite preview",
    "test:ci": "npm run build"
  }
}
```

> Si luego quieres subir la nota del proyecto, puedes reemplazar esos tests básicos por **Vitest/Jest** y añadir cobertura real.
