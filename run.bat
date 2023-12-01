@echo off

REM Verificar si el entorno virtual existe
if exist "huggingchat" (
    echo Entorno virtual 'huggingchat' ya existe. Activándolo...
) else (
    REM Crear el entorno virtual
    python -m venv huggingchat
    echo Entorno virtual 'huggingchat' creado.
)

REM Activar el entorno virtual
call huggingchat\Scripts\activate

REM Verificar si las dependencias ya están instaladas
set "dependencies_installed=true"

for /f %%i in (requirements.txt) do (
    pip list | find /i "%%i" > nul
    if errorlevel 1 (
        echo %%i NO está instalado
        set "dependencies_installed=false"
    ) else (
        echo %%i está instalado
    )
)

REM Si las dependencias no están instaladas, instalarlas
if "%dependencies_installed%"=="false" (
    echo Instalando dependencias desde requirements.txt...
    pip install -r requirements.txt

    REM Verificar si la instalación fue exitosa
    if %errorlevel% equ 0 (
        echo Instalación exitosa.
    ) else (
        echo Error durante la instalación. Revise el log anterior para más detalles.
    )
)

REM Ejecutar hugging-chat.py
python hugging-chat.py

REM Desactivar el entorno virtual
deactivate
