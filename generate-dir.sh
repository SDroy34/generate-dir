#!/bin/bash

if [ -z "$2" ]; then
    echo "Error: Debes proporcionar algun nombre de archivo"
    echo "Uso $(basename "$0") <nombre_proyecto> [opcion]"
    exit 1
fi

opcion="${1:-0}"
archivo="$2"

generarArchivo="$(pwd)/$archivo"

case "$opcion" in
    1|--mvc|-m )
        mkdir -p "$generarArchivo"/{models,controllers,views,css}
        echo "Estructura MVC creada en $generarArchivo"
        ;;
    2|--api|-a )
        mkdir -p "$generarArchivo"/{routers,controllers,config}
        echo "Estructura API creada en $generarArchivo"
        ;;
    3|--src|-s )
        mkdir -p "$generarArchivo"/{api,components,context,hooks,interfaces,navigator,screens,theme}
        echo "Estructura SRC creada en $generarArchivo"
        ;;
    0|default|"")
        mkdir -p "$generarArchivo"
        echo "Carpeta creada en: $generarArchivo"
        ;;
    *)
        echo "Opcion no reconocida: '$opcion'"
        echo "Opciones válidas: 1 (--mvc | -m ), 2 (--api | -a ), 3 (--scr | -s) o dejar vacio."
        exit 1
        ;;
esac
