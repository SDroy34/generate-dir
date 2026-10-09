#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Debes proporcionar algun nombre de archivo"
    echo "Uso $(basename "$0") <nombre_proyecto> [opcion]"
    exit 1
fi

archivo="$1"
opcion="${2:-0}"

generarArchivo="$(pwd)/$archivo"

echo "Ruta a generar proyecto: $generarArchivo"
case "$opcion" in
    1|--mvc|-m )
        mkdir -p "$generarArchivo"/{models,controllers,views,css}
        echo "Estructura MVC creada en $generarArchivo"
        ;;
    2|--api|-a )
        mkdir -p "$generarArchivo"/{routers,controllers,config}
        echo "Estructura API creada en $generarArchivo"
        ;;
    0|default|"")
        mkdir -p "$generarArchivo"
        echo "Carpeta creada en: $generarArchivo"
        ;;
    *)
        echo "Opcion no reconocida: '$opcion'"
        echo "Opciones válidas: 1 (--mvc | -m ), 2 (--api | -a ) o dejar vacio."
        exit 1
        ;;
esac
