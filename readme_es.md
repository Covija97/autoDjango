[english](README.md)

# autoDjango

> **Archivo .bat** que genera automáticamente la estructura descrita en [w3school](https://www.w3schools.com/django/) para crear proyectos Django

## [createdjango.bat](/src/createdjango.bat)

### **Uso**

1. Descarga el archivo [createdjango.bat](/src/createdjango.bat).
2. Colócalo en el directorio raíz de tu proyecto Django.
3. Haz doble clic sobre `createdjango.bat`.

### **Estructura**

El script `createdjango.bat` automatiza la configuración de un entorno de proyecto Django. Realiza las siguientes tareas:

1. **Verificar versión de Python**: Verifica si Python está instalado en el sistema.
2. **Verificar versión de pip**: Asegura que pip, el instalador de paquetes de Python, esté disponible.
3. **Crear entorno virtual**: Solicita al usuario un nombre para el entorno virtual y lo crea si no existe.
4. **Activar entorno virtual**: Activa el entorno virtual especificado.
5. **Actualizar pip**: Actualiza pip a la última versión dentro del entorno virtual.
6. **Instalar Django**: Instala Django usando pip.
7. **Solicitar nombre del proyecto Django**: Solicita al usuario que ingrese un nombre para el nuevo proyecto Django, asegurándose de que sea válido y no esté en uso.
8. **Crear proyecto Django**: Utiliza `django-admin` para crear un nuevo proyecto Django con el nombre especificado.
9. **Verificar creación del proyecto**: Comprueba si el proyecto se creó correctamente y proporciona retroalimentación.
10. **Crear script de instalación de módulos**: Genera un archivo por lotes (`install_modules.bat`) para instalar módulos adicionales de Python dentro del entorno virtual.
11. **Crear script de ejecución**: Genera un archivo por lotes (`run_<project_name>.bat`) para iniciar fácilmente el servidor de desarrollo de Django para el nuevo proyecto.
12. **Crear script de aplicaciones**: Genera un archivo por lotes (`apps_<project_name>.bat`) para crear nuevas aplicaciones Django dentro del proyecto.

Este script simplifica el proceso de configuración inicial para proyectos Django, asegurando que todos los componentes necesarios estén instalados y configurados correctamente.