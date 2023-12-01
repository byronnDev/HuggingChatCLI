#!/bin/bash

# Verificar si el entorno virtual existe
if [ -d "huggingchat" ]; then
        echo "Entorno virtual 'huggingchat' ya existe. Activándolo..."
else
        # Crear el entorno virtual
        python -m venv huggingchat
        echo "Entorno virtual 'huggingchat' creado."
fi

# Activar el entorno virtual
source huggingchat/bin/activate

# Verificar si las dependencias ya están instaladas
while IFS= read -r package
do
    if pip list | grep -Fq -x "$package"; then
        echo "$package está instalado"
    else
        echo "$package NO está instalado"
        # Instalar los paquetes desde requirements.txt
        pip install -r requirements.txt

        # Verificar si la instalación fue exitosa
        if [ $? -eq 0 ]; then
                echo "Instalación exitosa. Ejecutando hugging-chat.py..."
        else
                echo "Error durante la instalación. Revise el log anterior para más detalles."
        fi
    fi
done < requirements.txt

python hugging-chat.py

# Desactivar el entorno virtual
deactivate