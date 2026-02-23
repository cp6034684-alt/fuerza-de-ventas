#!/bin/bash

echo "
╔══════════════════════════════════════════════════════════╗
║                                                          ║
║   🔄 ACTUALIZAR URL DEL BACKEND                         ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
"

# Pedir la URL del backend
echo "📝 Ingresa la URL de tu backend desplegado en Railway:"
echo "   (Ejemplo: https://facturacion-backend.up.railway.app)"
read -p "> " BACKEND_URL

# Validar URL
if [[ -z "$BACKEND_URL" ]]; then
    echo "❌ Error: Debes ingresar una URL"
    exit 1
fi

# Actualizar archivo config.js
cat > app/public/config.js << EOF
// Configuración del backend
// Esta URL apunta a tu backend desplegado en Railway
window.BACKEND_URL = '$BACKEND_URL';
EOF

echo "✅ Archivo config.js actualizado"

# Reconstruir el frontend
echo ""
echo "📦 Reconstruyendo frontend..."
cd app
npm run build

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Frontend reconstruido exitosamente"
    echo ""
    echo "📁 Los archivos actualizados están en: app/dist/"
    echo ""
    echo "🚀 Sube la carpeta app/dist/ a tu hosting:"
    echo "   • Netlify: https://app.netlify.com/drop"
    echo "   • Vercel: https://vercel.com"
    echo "   • GitHub Pages"
    echo ""
    echo "📝 La nueva URL del backend es: $BACKEND_URL"
else
    echo "❌ Error al construir el frontend"
    exit 1
fi
