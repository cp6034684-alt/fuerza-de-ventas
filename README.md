# Backend - Sistema de Facturación

Backend con sincronización en tiempo real usando WebSockets (Socket.io).

## 🚀 Características

- **Sincronización en tiempo real** - Todos los vendedores ven los mismos datos actualizados
- **WebSockets** - Comunicación bidireccional instantánea
- **API REST** - Endpoints para todas las operaciones CRUD
- **Base de datos en memoria** - Para demo (migrar a MongoDB/PostgreSQL en producción)

## 📦 Instalación

```bash
npm install
```

## 🏃 Iniciar servidor

```bash
npm start
```

El servidor iniciará en el puerto **3001** (o el puerto definido en la variable de entorno PORT).

## 🔌 WebSocket Events

### Cliente → Servidor
- `join` - Unirse a sala de usuario

### Servidor → Cliente
- `init` - Datos iniciales al conectar
- `update` - Actualización de datos (tipo: clientes, productos, ventas, movimientos)
- `nueva-venta` - Notificación de nueva venta realizada

## 🔗 API Endpoints

### Autenticación
- `POST /api/login` - Iniciar sesión

### Clientes
- `GET /api/clientes` - Obtener todos los clientes
- `POST /api/clientes/import` - Importar clientes (bulk)
- `POST /api/clientes` - Crear cliente

### Productos
- `GET /api/productos` - Obtener todos los productos
- `POST /api/productos` - Crear producto
- `PUT /api/productos/:id` - Actualizar producto
- `DELETE /api/productos/:id` - Eliminar producto

### Ventas
- `GET /api/ventas` - Obtener todas las ventas
- `POST /api/ventas` - Crear venta
- `PUT /api/ventas/:id/anular` - Anular venta

### Inventario
- `GET /api/movimientos` - Obtener movimientos
- `POST /api/movimientos` - Crear movimiento

### Reportes
- `GET /api/reportes/resumen` - Obtener resumen de ventas

## 🔄 Sincronización en Tiempo Real

Cuando cualquier usuario realiza una operación:
1. El servidor actualiza la base de datos
2. El servidor emite un evento `update` a TODOS los clientes conectados
3. Los clientes reciben los datos actualizados automáticamente

## 📝 Credenciales por defecto

| Rol | Email | Contraseña |
|-----|-------|------------|
| Admin | admin@sistema.com | admin123 |
| Vendedor | luz@sistema.com | vendedor123 |
| Vendedor | carlos@sistema.com | vendedor123 |

## 🛠️ Migración a Base de Datos Real

Para producción, reemplazar el objeto `db` en `server.js` con:

```javascript
// MongoDB con Mongoose
const mongoose = require('mongoose');
mongoose.connect(process.env.MONGODB_URI);

// O PostgreSQL con Sequelize
const { Sequelize } = require('sequelize');
const sequelize = new Sequelize(process.env.DATABASE_URL);
```
