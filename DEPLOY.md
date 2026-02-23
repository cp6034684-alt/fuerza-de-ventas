# 🚀 Guía de Despliegue

Esta guía te ayudará a desplegar el backend en **Railway** (gratuito) y el frontend en cualquier servicio estático.

---

## 📋 Paso 1: Desplegar el Backend en Railway

### Opción A: Despliegue Automático (Recomendado)

1. **Crea una cuenta en Railway**
   - Ve a https://railway.app
   - Regístrate con GitHub

2. **Crea un nuevo proyecto**
   - Click en "New Project"
   - Selecciona "Deploy from GitHub repo"
   - Sube el código a GitHub primero (ver abajo)

3. **Sube el código a GitHub**
   ```bash
   # Crea un nuevo repositorio en GitHub
   # Luego ejecuta estos comandos en tu computadora:
   
   cd /mnt/okcomputer/output/backend
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/TU_USUARIO/facturacion-backend.git
   git push -u origin main
   ```

4. **Conecta Railway con GitHub**
   - En Railway, selecciona tu repositorio
   - Railway detectará automáticamente el Dockerfile
   - Click en "Deploy"

5. **Obtén la URL del backend**
   - Ve a la pestaña "Settings" de tu servicio
   - Copia el "Public Domain" (ej: `https://facturacion-backend.up.railway.app`)

### Opción B: Despliegue Manual con CLI

1. **Instala Railway CLI**
   ```bash
   npm install -g @railway/cli
   ```

2. **Login y despliegue**
   ```bash
   cd /mnt/okcomputer/output/backend
   railway login
   railway init
   railway up
   railway domain
   ```

---

## 🌐 Paso 2: Actualizar el Frontend

1. **Edita el archivo de configuración**
   ```bash
   cd /mnt/okcomputer/output/app
   ```

2. **Abre `.env` y cambia la URL:**
   ```
   VITE_BACKEND_URL=https://TU_BACKEND_URL.railway.app
   ```
   (Reemplaza con la URL que obtuviste en el Paso 1)

3. **Reconstruye el frontend:**
   ```bash
   npm run build
   ```

---

## 📱 Paso 3: Desplegar el Frontend

### Opción A: Netlify (Recomendado - Gratuito)

1. Ve a https://netlify.com
2. Arrastra la carpeta `app/dist` al dashboard
3. ¡Listo! Obtendrás una URL como `https://facturacion-abc123.netlify.app`

### Opción B: Vercel

1. Ve a https://vercel.com
2. Importa tu proyecto desde GitHub
3. Configura el directorio de salida como `dist`

### Opción C: GitHub Pages

1. Sube el código a GitHub
2. Ve a Settings → Pages
3. Selecciona la rama `gh-pages` o `main` con carpeta `/docs`
4. Copia los archivos de `dist` a la carpeta seleccionada

---

## ✅ Paso 4: Verificar el Despliegue

1. **Abre el frontend** en tu navegador
2. **Inicia sesión** con las credenciales:
   - Admin: `admin@sistema.com` / `admin123`
3. **Verifica la conexión** - Deberías ver "Online" en la esquina superior
4. **Prueba la sincronización**:
   - Abre el frontend en 2 dispositivos diferentes
   - Haz una venta en uno
   - Verifica que el stock se actualiza en el otro

---

## 🔧 Solución de Problemas

### Error "No se puede conectar al backend"

1. Verifica que el backend esté corriendo:
   ```bash
   curl https://TU_BACKEND_URL.railway.app/api/clientes
   ```

2. Verifica CORS en `backend/server.js`:
   - Asegúrate de que la URL del frontend esté permitida

3. Revisa los logs en Railway:
   - Ve a la pestaña "Logs" en Railway

### Error "WebSocket no conecta"

1. Railway soporta WebSockets nativamente
2. Verifica que el frontend use `wss://` (no `ws://`) en producción

---

## 📝 Variables de Entorno en Railway

Si necesitas configurar variables de entorno en Railway:

1. Ve a tu proyecto en Railway
2. Click en "Variables"
3. Agrega:
   - `PORT=3001` (Railway lo configura automáticamente)
   - `NODE_ENV=production`

---

## 🎉 ¡Listo!

Una vez desplegado:
- Los vendedores pueden acceder desde cualquier lugar
- Los datos se sincronizan en tiempo real
- El admin puede gestionar todo desde cualquier dispositivo

**URL típica del backend:** `https://facturacion-backend.up.railway.app`
**URL típica del frontend:** `https://facturacion-abc123.netlify.app`
