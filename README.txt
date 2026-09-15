# Archivos Necesarios para Levantar la Aplicación de Toma de Tiempos

Este documento resume los archivos externos que deben acompañar al ejecutable de la aplicación (Delphi/Pascal) para que funcione correctamente. Todos deben colocarse **en la misma carpeta que el `.exe`** de la aplicación, salvo que se indique lo contrario.

## Resumen

| Archivo | Función | Usado por |
|---|---|---|
| `libmysql55.dll` | Driver nativo de conexión a MySQL | Zeos |
| `gridTranslation.ini` | Traducción de textos de la grilla | Componente de grilla |
| `config.ini` | Configuración general de la app | Aplicación |
| `curl.exe` + `curl-ca-bundle.crt` | Publicación de la grilla de resultados | Módulo de publicación |

---

## 1. `libmysql55.dll`

**Requerido por:** Zeos (componente de acceso a datos MySQL).

Es la librería cliente de MySQL que Zeos utiliza para establecer la conexión con la base de datos. Sin este archivo en la carpeta del ejecutable, la aplicación no podrá conectarse a MySQL y fallará al iniciar o al intentar cualquier operación de base de datos.

> **Nota:** debe coincidir la arquitectura (32/64 bits) con la del ejecutable compilado.

## 2. `gridTranslation.ini`

**Requerido por:** Traducción de la grilla.

Contiene las cadenas de texto (encabezados, etiquetas, mensajes) que se muestran en el componente de grilla de la aplicación, permitiendo mostrar los textos en el idioma configurado en lugar de los valores por defecto del componente.

## 3. `config.ini`

**Requerido por:** Configuración de la aplicación.

Archivo central de configuración de la app (parámetros generales, rutas, credenciales, opciones de conexión, etc., según lo definido en el proyecto). Debe existir y estar correctamente completado antes de ejecutar la aplicación por primera vez.

## 4. `curl.exe` y `curl-ca-bundle.crt`

**Requerido por:** Publicación de la grilla de resultados.

- `curl.exe`: ejecutable de línea de comandos que la aplicación invoca para enviar/publicar los resultados (por ejemplo, vía HTTP/HTTPS a un servidor o servicio externo).
- `curl-ca-bundle.crt`: certificados raíz necesarios para que `curl` pueda validar conexiones HTTPS. Sin este archivo, las publicaciones sobre HTTPS pueden fallar por errores de verificación de certificado (SSL/TLS).

---

## Checklist de instalación

- [ ] `libmysql55.dll` copiado junto al ejecutable
- [ ] `gridTranslation.ini` copiado junto al ejecutable
- [ ] `config.ini` presente y configurado correctamente
- [ ] `curl.exe` copiado junto al ejecutable
- [ ] `curl-ca-bundle.crt` copiado junto al ejecutable (misma carpeta que `curl.exe`)
