@echo off

rd /q /s "%~dp0env" 2>nul
python -m venv "%~dp0env"
call "%~dp0env\Scripts\activate.bat"
python -m pip freeze > "%~dp0env\requirements.txt"
copy /y "%~dp0env\requirements.txt" "%~dp0" >nul
