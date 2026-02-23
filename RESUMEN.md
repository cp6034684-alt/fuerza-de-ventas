# 🎯 Resumen del Sistema de Facturación

## ✅ Lo que tienes ahora

### Frontend (YA DESPLEGADO)
🔗 **URL:** https://yt2d4dc4zuuhy.ok.kimi.link

El frontend está listo y funcionando. Puedes acceder desde cualquier dispositivo.

### Backend (NECESITA DESPLEGARSE)
📁 **Ubicación:** `/mnt/okcomputer/output/backend/`

El backend necesita ser desplegado en Railway para que la sincronización funcione.

---

## 🚀 Pasos para completar el despliegue

### Paso 1: Desplegar el Backend (5 minutos)

1. **Crea una cuenta gratuita en Railway:**
   - Ve a https://railway.app
   - Regístrate con GitHub

2. **Sube el backend a GitHub:**
   ```bash
   cd /mnt/okcomputer/output/backend
   git init
   git add .
   git commit -m "Backend inicial"
   git branch -M main
   git remote add origin https://github.com/TU_USUARIO/facturacion-backend.git
   git push -u origin main
   ```

3. **Despliega en Railway:**
   - En Railway: "New Project" → "Deploy from GitHub repo"
   - Selecciona tu repositorio
   - Railway detectará el Dockerfile automáticamente
   - Espera 2-3 minutos

4. **Copia la URL del backend:**
   - Ve a Settings → Public Domain
   - Copia algo como: `https://facturacion-backend.up.railway.app`

### Paso 2: Actualizar el Frontend (2 minutos)

1. **Ejecuta el script de actualización:**
   ```bash
   cd /mnt/okcomputer/output
   ./actualizar-backend.sh
   ```

2. **Ingresa la URL de tu backend** cuando te la pida

3. **Sube la carpeta `app/dist/` a Netlify:**
   - Ve a https://app.netlify.com/drop
   - Arrastra la carpeta `app/dist`
   - Obtendrás una nueva URL

### Paso 3: ¡Probar! (1 minuto)

1. Abre el frontend en 2 dispositivos
2. Inicia sesión con el mismo vendedor
3. Haz una venta en uno
4. Verifica que el stock se actualiza en el otro

---

## 📁 Archivos importantes

| Archivo | Descripción |
|---------|-------------|
| `backend/server.js` | Servidor principal con WebSockets |
| `backend/Dockerfile` | Configuración para Railway |
| `app/public/config.js` | URL del backend (editar esto) |
| `actualizar-backend.sh` | Script para actualizar la URL |
| `GUIA_DESPLIEGUE.md` | Guía completa detallada |

---

## 🔐 Credenciales

| Rol | Email | Contraseña |
|-----|-------|------------|
| Admin | admin@sistema.com | admin123 |
| Vendedor | luz@sistema.com | vendedor123 |
| Vendedor | carlos@sistema.com | vendedor123 |

---

## ⚡ Desarrollo local

Si quieres probar en tu computadora antes de desplegar:

```bash
cd /mnt/okcomputer/output
./start.sh
```

Esto inicia:
- Backend en http://localhost:3001
- Frontend en http://localhost:5173

---

## 🎉 Funcionalidades

✅ **Sincronización en tiempo real** - Todos los vendedores ven los mismos datos  
✅ **Ventas con GPS** - Registra ubicación de cada venta  
✅ **Inventario automático** - Stock se actualiza al instante  
✅ **Reportes** - Dashboard con gráficos y estadísticas  
✅ **Mapa GPS** - Visualiza clientes en el mapa  
✅ **Importar clientes** - Desde Excel  
✅ **PWA** - Funciona como app nativa en Android  

---

## ❓ ¿Necesitas ayuda?

Si tienes problemas:

1. **Revisa los logs del backend** en Railway (pestaña Logs)
2. **Verifica la consola del navegador** (F12 → Console)
3. **Asegúrate de que la URL del backend sea correcta** en `config.js`
4. **Prueba el backend directamente:**
   ```bash
   curl https://TU_BACKEND_URL.railway.app/api/clientes
   ```

---

## 📞 Contacto

¿Preguntas? Revisa:
- `GUIA_DESPLIEGUE.md` - Guía completa paso a paso
- `DEPLOY.md` - Información técnica de despliegue
- `backend/README.md` - Documentación del backend

---

**¡Listo para usar!** 🚀
