const path = require('path');
const TerserPlugin = require('terser-webpack-plugin');

module.exports = {
    entry: {
        alumnos: './web/js/alumnos.js',
        calendario: './web/js/calendario.js',
        compruebaSesion: './web/js/compruebaSesion.js',
        contacto: './web/js/contacto.js',
        detallesAlumno: './web/js/detallesAlumno.js',
        eliminar: './web/js/eliminar.js',
        ingresos: './web/js/ingresos.js',
        ingresosP: './web/js/ingresosP.js',
        inicio: './web/js/inicio.js',
        login: './web/js/login.js',
        perfil: './web/js/perfil.js',
        register: './web/js/register.js',
        rutas: './web/js/rutas.js',
    },
    output: {
        filename: '[name].min.js',
        path: path.resolve(__dirname, 'web/js/dist'),
    },    
    optimization: {
        minimize: true,
        minimizer: [new TerserPlugin({
            terserOptions: {
                // Aquí puedes configurar opciones de ofuscación adicionales
                compress: {},
                mangle: true, // Nota que mangling puede cambiar los nombres de tus variables y funciones.
                // Más opciones de Terser pueden ser configuradas aquí
            },
        })],
    },
    mode: 'production',
};
