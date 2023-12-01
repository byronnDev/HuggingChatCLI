# Proyecto HugChat

Este proyecto utiliza la biblioteca `hugchat` para interactuar con el chatbot LLaMA de Meta.


![image](https://github.com/byronnDev/HuggingChatCLI/assets/38868773/e02d1973-aaad-4921-8f63-42f9e1b0ab85)


## Configuración

El proyecto requiere un archivo `.env` en el directorio raíz con las siguientes variables de entorno:

```
EMAIL="tu_email"
PASS="tu_contraseña"
```

Estas credenciales son utilizadas para iniciar sesión en el chatbot, a través de tu cuenta de [Hugging Face](https://huggingface.co/).

Puedes probarlo desde la web de [Hugging Face](https://huggingface.co/), o ejecutarlo en tu entorno local a través de éste repositorio.

## Uso

El script principal es `hugchat.py`. Define una función `generate_response` que toma un mensaje de entrada y devuelve una respuesta del chatbot.

La función `generate_response` inicia sesión en el chatbot, crea una nueva conversación, y envía el mensaje de entrada al chatbot. Luego recoge y devuelve la respuesta del chatbot.

Parámetros:
- `prompt`: mensaje de entrada
- `email`: email de la cuenta de Hugging Face
- `password`: contraseña de la cuenta de Hugging Face
- `stream`: si es `True`, devuelve la respuesta del chatbot como un stream de texto progresivo. Si es `False`, devuelve la respuesta del chatbot como un string.

## Ejecución

Para ejecutar el script si usas Windows, puedes ejecutar el archivo `run.bat`.

Si usas Linux, puedes ejecutar el archivo `run.sh`:

```bash
chmod +x run.sh
./run.sh
```
