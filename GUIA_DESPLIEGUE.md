# 🚀 Guía de Despliegue Completo

## ✅ Estado Actual

- ✅ **Frontend desplegado:** https://yt2d4dc4zuuhy.ok.kimi.link
- ⏳ **Backend:** Necesita desplegarse en Railway

---

## 📋 PASO 1: Desplegar el Backend en Railway

Railway ofrece hosting gratuito para proyectos pequeños.

### 1.1 Crear cuenta en Railway

1. Ve a https://railway.app
2. Haz clic en "Get Started"
3. Regístrate con tu cuenta de GitHub

### 1.2 Crear un nuevo proyecto

1. En el dashboard de Railway, haz clic en "New Project"
2. Selecciona "Deploy from GitHub repo"
3. Si es la primera vez, autoriza Railway a acceder a tu GitHub

### 1.3 Subir el backend a GitHub

```bash
# Abre una terminal en tu computadora y ejecuta:

cd /mnt/okcomputer/output/backend

# Inicializa git
git init

# Agrega todos los archivos
git add .

# Crea el primer commit
git commit -m "Backend inicial"

# Crea un nuevo repositorio en GitHub (sin README, sin .gitignore)
# Luego conecta tu repositorio local:
git branch -M main
git remote add origin https://github.com/TU_USUARIO/facturacion-backend.git
git push -u origin main
```

### 1.4 Desplegar en Railway

1. En Railway, selecciona el repositorio `facturacion-backend`
2. Railway detectará automáticamente el `Dockerfile`
3. Haz clic en "Deploy"
4. Espera a que termine el despliegue (2-3 minutos)

### 1.5 Obtener la URL del backend

1. Ve a la pestaña "Settings" de tu servicio
2. Busca "Public Domain"
3. Copia la URL (ejemplo: `https://facturacion-backend.up.railway.app`)

---

## 📋 PASO 2: Configurar el Frontend

### 2.1 Editar la configuración del backend

1. Abre el archivo de configuración del frontend:
   https://yt2d4dc4zuuhy.ok.kimi.link/config.js

2. **NO puedes editar directamente**, así que necesitas:
   - Descargar el frontend
   - Editar el archivo `config.js`
   - Volver a subirlo

### Opción más fácil: Reconstruir y redeploy

```bash
# En tu computadora:
cd /mnt/okcomputer/output/app/public

# Edita config.js y cambia la URL:
# window.BACKEND_URL = 'https://TU_BACKEND_URL.railway.app';

# Luego reconstruye:
cd ..
npm run build

# Sube la carpeta dist/ a cualquier servicio de hosting estático
```

### 2.2 Alternativa: Usar Netlify Drop (Muy fácil)

1. Ve a https://app.netlify.com/drop
2. Arrastra la carpeta `app/dist` al área indicada
3. Obtendrás una URL como `https://facturacion-xyz.netlify.app`

---

## 📋 PASO 3: Verificar la Conexión

1. Abre el frontend en tu navegador
2. Inicia sesión con:
   - **Admin:** admin@sistema.com / admin123
   - **Vendedor:** luz@sistema.com / vendedor123
3. Deberías ver "Online" en la esquina superior izquierda
4. Si dice "Offline", revisa la URL del backend en config.js

---

## 🧪 Probar la Sincronización

1. **Abre el frontend en 2 dispositivos** (o 2 pestañas del navegador)
2. **Inicia sesión** con el mismo vendedor en ambos
3. **En el dispositivo 1:**
   - Ve a "Ventas"
   - Selecciona un cliente
   - Agrega un producto al carrito
   - Finaliza la venta
4. **En el dispositivo 2:**
   - Ve a "Productos"
   - Verifica que el stock del producto vendido haya disminuido
   - Ve a "Reportes" y deberías ver la venta registrada

---

## 🔧 Solución de Problemas

### "No se puede conectar al backend"

1. Verifica que el backend esté corriendo:
   ```bash
   curl https://TU_BACKEND_URL.railway.app/api/clientes
   ```
   Debería devolver `[]` (array vacío) o la lista de clientes.

2. Revisa los logs en Railway:
   - Ve a Railway → tu proyecto → pestaña "Logs"

3. Verifica CORS:
   - El backend ya tiene CORS configurado para permitir cualquier origen
   - Si tienes problemas, verifica que el frontend use `https` (no `http`)

### "WebSocket no conecta"

Railway soporta WebSockets nativamente. Si no conecta:
1. Verifica que la URL del backend sea correcta
2. Asegúrate de usar `wss://` (WebSocket seguro) en producción
3. El frontend ya está configurado para usar el protocolo correcto

### "Los datos no se sincronizan"

1. Verifica que ambos dispositivos estén conectados al mismo backend
2. Revisa la consola del navegador (F12 → Console) por errores
3. Verifica que el indicador diga "Online" en ambos dispositivos

---

## 📁 Estructura de Archivos

```
/mnt/okcomputer/output/
├── backend/              # Backend Node.js
│   ├── server.js         # Servidor principal
│   ├── Dockerfile        # Configuración Docker
│   ├── railway.json      # Configuración Railway
│   └── package.json
│
├── app/                  # Frontend React
│   ├── src/              # Código fuente
│   ├── public/           # Archivos públicos
│   │   └── config.js     # ← EDITAR ESTE ARCHIVO
│   └── dist/             # Build para producción
│
├── GUIA_DESPLIEGUE.md    # Esta guía
└── start.sh              # Script para desarrollo local
```

---

## 📝 Credenciales de Prueba

| Rol | Email | Contraseña |
|-----|-------|------------|
| **Administrador** | admin@sistema.com | admin123 |
| **Vendedor 1** | luz@sistema.com | vendedor123 |
| **Vendedor 2** | carlos@sistema.com | vendedor123 |

---

## 🎉 ¡Listo!

Una vez completados estos pasos:
- ✅ Los vendedores pueden acceder desde cualquier lugar
- ✅ Los datos se sincronizan en tiempo real
- ✅ El admin puede gestionar todo desde cualquier dispositivo
- ✅ El inventario se actualiza automáticamente para todos

---

## 💡 Consejos

1. **Para desarrollo local:** Usa `./start.sh` para iniciar backend y frontend
2. **Para producción:** Asegúrate de que el backend esté en un servidor confiable
3. **Base de datos:** El backend usa memoria RAM. Para producción real, migra a MongoDB o PostgreSQL
4. **Seguridad:** Las contraseñas están en texto plano para el demo. En producción, usa bcrypt

---

## 📞 Soporte

Si tienes problemas:
1. Revisa los logs del backend en Railway
2. Verifica la consola del navegador (F12)
3. Asegúrate de que la URL del backend sea correcta en `config.js`
