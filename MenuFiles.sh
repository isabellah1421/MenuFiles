#!/bin/bash
#Script hecho por: Isabella Huerta, Raquel Bascones, Ingrid Carvalhais

# Función para mostrar el menú de opciones
mostrar_menu() {
  echo "Menú de opciones:"
  echo "1. Crear carpeta y archivos"
  echo "2. Mover archivos a una carpeta"
  echo "3. Eliminar archivos de una carpeta"
  echo "4. Salir"
}

# Función para crear la carpeta y archivos dentro de ella
crear_archivos() {
  read -p "Introduzca el nombre de la carpeta: " carpeta
  mkdir "$carpeta"
  echo "Carpeta creada: $carpeta"

  read -p "Introduzca el nombre del primer archivo: " archivo1
  touch "$carpeta/$archivo1"
  echo "Archivo creado: $archivo1"

  read -p "Introduzca el nombre del segundo archivo: " archivo2
  touch "$carpeta/$archivo2"
  echo "Archivo creado: $archivo2"
  echo "       "
}

# Función para mover archivos a una carpeta
mover_archivos() {
    read -p "Introduzca la ubicación del archivo a mover (ruta absoluta): " origen
    echo "Listado de archivos en la carpeta $origen:"
    ls "$origen"
    read -p "Introduzca el nombre del archivo que desea mover: " archivo
    read -p "Introduzca la ubicación a donde desea mover el archivo (ruta absoluta): " destino
    mv "$origen/$archivo" "$destino"  # Mover el archivo al destino
    echo "Archivo movido: $destino/$archivo"
    echo "       "
}
# Función para eliminar archivos de una carpeta
eliminar_archivos() {
    read -p "Introduzca la ubicación de la carpeta donde se encuentra el archivo que desea eliminar (ruta absoluta): " ubicacion_archivo
    echo "Listado de archivos en la carpeta $ubicacion_archivo:"
    ls "$ubicacion_archivo"
    read -p "Introduzca el nombre del archivo que desea eliminar: " archivo
    rm "$ubicacion_archivo/$archivo"  # Eliminar el archivo
    echo "Archivo eliminado: $ubicacion_archivo/$archivo"
    echo "       "
}

# Ciclo para mostrar el menú y ejecutar opciones
while true; do
    mostrar_menu

    read -p "Seleccione una opción: " opcion

    if [ "$opcion" == "1" ]; then
        crear_archivos
    elif [ "$opcion" == "2" ]; then
        mover_archivos
    elif [ "$opcion" == "3" ]; then
        eliminar_archivos
    elif [ "$opcion" == "4" ]; then
        echo "Saliendo del script."
        break
    else
        echo "La opción elegida no corresponde a ninguna de las disponbles en el menú. Por favor, seleccione una opción válida."
    fi
done