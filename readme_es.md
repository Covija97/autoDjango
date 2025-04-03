[english](README.md)

# autoDjango

> **Archivo .bat** que automatiza la creación y configuración de proyectos Django, incluyendo entornos virtuales, inicialización de proyectos y scripts de utilidad.

## [createdjango.bat](/src/createdjango.bat)

### **Uso**

1. Descarga el archivo [createdjango.bat](/src/createdjango.bat).
2. Colócalo en el directorio donde deseas crear tu proyecto Django.
3. Haz doble clic sobre `createdjango.bat` y sigue las instrucciones.

### **Características**

El script `createdjango.bat` realiza las siguientes tareas:

1. **Verificar versión de Python**: Asegura que Python esté instalado en el sistema.
2. **Verificar versión de pip**: Comprueba que pip esté disponible.
3. **Crear entorno virtual**: Solicita un nombre para el entorno virtual y lo crea si no existe.
4. **Activar entorno virtual**: Activa el entorno virtual.
5. **Actualizar pip**: Actualiza pip a la última versión.
6. **Instalar Django**: Instala Django en el entorno virtual.
7. **Solicitar nombre del proyecto Django**: Verifica que el nombre del proyecto sea válido y no esté en uso.
8. **Crear proyecto Django**: Inicializa un nuevo proyecto Django usando `django-admin`.
9. **Verificar creación del proyecto**: Confirma que el proyecto se haya creado correctamente.
10. **Generar scripts de utilidad**:
    - **Script de instalación de módulos**: Crea `CD_install_modules.bat` para instalar módulos adicionales de Python.
    - **Script para ejecutar el servidor**: Crea `CD_run_<project_name>.bat` para iniciar el servidor de desarrollo de Django.
    - **Script para crear aplicaciones**: Crea `CD_create_apps.bat` para añadir nuevas aplicaciones Django al proyecto.

### **Scripts Generados**

- **`CD_install_modules.bat`**: Permite instalar módulos adicionales de Python y recuerda añadirlos a `INSTALLED_APPS` en la configuración de Django.
- **`CD_run_<project_name>.bat`**: Activa el entorno virtual e inicia el servidor de desarrollo de Django.
- **`CD_create_apps.bat`**: Automatiza la creación de nuevas aplicaciones Django dentro del proyecto.

Este script simplifica el proceso de configuración inicial para proyectos Django, asegurando que todos los componentes necesarios estén configurados correctamente.