# Sistema de Facturación - Fuerza de Ventas

Sistema completo con sincronización en tiempo real entre múltiples vendedores.

## 🎯 Características Principales

- ✅ **Sincronización en tiempo real** - Todos los vendedores ven los mismos datos actualizados
- ✅ **WebSockets** - Comunicación instantánea entre dispositivos
- ✅ **Base de datos centralizada** - Un solo punto de verdad para todos los datos
- ✅ **PWA** - Funciona como app nativa en Android
- ✅ **Offline-first** - Funciona sin conexión y sincroniza cuando hay internet

## 📁 Estructura del Proyecto

```
/output/
├── backend/          # Servidor Node.js + Socket.io
│   ├── server.js     # Servidor principal
│   └── package.json
│
├── app/              # Frontend React + PWA
│   ├── src/          # Código fuente
│   ├── dist/         # Build para producción
│   └── package.json
│
└── README.md         # Este archivo
```

## 🚀 Inicio Rápido

### 1. Iniciar el Backend

```bash
cd backend
npm install
npm start
```

El backend iniciará en `http://localhost:3001`

### 2. Iniciar el Frontend

```bash
cd app
npm install
npm run dev
```

El frontend estará en `http://localhost:5173`

## 🔐 Credenciales de Prueba

| Rol | Email | Contraseña |
|-----|-------|------------|
| **Administrador** | admin@sistema.com | admin123 |
| **Vendedor 1** | luz@sistema.com | vendedor123 |
| **Vendedor 2** | carlos@sistema.com | vendedor123 |

## 📱 Instalación en Android

1. Abre el frontend en Chrome en tu dispositivo Android
2. Toca el menú (⋮) → "Agregar a pantalla de inicio"
3. La app se instalará como aplicación nativa

## 🔄 Cómo funciona la sincronización

```
┌─────────────┐     WebSocket      ┌─────────────┐
│  Vendedor 1 │ ◄────────────────► │   Backend   │
│  (Celular)  │                    │  (Servidor) │
└─────────────┘                    └──────┬──────┘
                                          │
┌─────────────┐     WebSocket           │
│  Vendedor 2 │ ◄───────────────────────┘
│  (Celular)  │
└─────────────┘

Cuando Vendedor 1 hace una venta:
1. Se envía al backend
2. El backend actualiza la base de datos
3. El backend notifica a TODOS los vendedores conectados
4. Los vendedores 1 y 2 ven la venta y el stock actualizado
```

## 📊 Importar Clientes

1. Inicia sesión como **administrador**
2. Ve a **Administración → Clientes**
3. Sube tu archivo Excel con las columnas:
   - Identificación, Cod Asesor, Asesor, NIT, Cod Cliente
   - Cliente, Nombre Común, Contacto, Canal, Dirección
   - Barrio, Ciudad, Telefono, Segmento, Zona, Macrozona
   - Longitud, Latitud

## 🛠️ Tecnologías

### Backend
- **Node.js** + **Express** - Servidor HTTP
- **Socket.io** - WebSockets para tiempo real
- **CORS** - Comunicación entre dominios
- **UUID** - Generación de IDs únicos

### Frontend
- **React** + **TypeScript** + **Vite**
- **Tailwind CSS** + **shadcn/ui** - Estilos
- **Socket.io-client** - Conexión WebSocket
- **Recharts** - Gráficos
- **PWA** - Service Worker + Manifest

## 📝 Variables de Entorno

### Frontend (.env)
```
VITE_BACKEND_URL=http://localhost:3001
```

### Backend (variables de entorno opcionales)
```
PORT=3001
```

## 🌐 Despliegue en Producción

### Backend
1. Usar **Railway**, **Render** o **Heroku**
2. Configurar variables de entorno
3. El servidor debe estar accesible públicamente

### Frontend
1. Cambiar `VITE_BACKEND_URL` a la URL del backend en producción
2. Ejecutar `npm run build`
3. Subir la carpeta `dist/` a **Vercel**, **Netlify** o **GitHub Pages**

## ⚠️ Notas Importantes

- **Base de datos**: El backend usa almacenamiento en memoria para el demo. Para producción, migrar a MongoDB o PostgreSQL.
- **Persistencia**: Los datos se pierden si el servidor se reinicia. En producción usar base de datos persistente.
- **Seguridad**: Las contraseñas están en texto plano para el demo. En producción usar bcrypt.

## 🆘 Soporte

Si tienes problemas:
1. Verifica que el backend esté corriendo en el puerto 3001
2. Verifica que el frontend apunte a la URL correcta del backend
3. Revisa la consola del navegador para errores
4. Revisa los logs del backend

---

**Versión:** 2.0.0 - Con sincronización en tiempo real  
**Fecha:** Febrero 2026
