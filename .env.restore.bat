@echo off

if exist "%~dp0.env\requirements.txt" goto :eof

rd /q /s "%~dp0.env" 2>nul
python -m venv "%~dp0.env"
call "%~dp0.env\Scripts\activate.bat"
python -m pip install --upgrade pip
python -m pip freeze > "%~dp0.env\requirements.txt"
attrib -a -s +h -r "%~dp0.env"
attrib +a -s +h -r "%~dp0.env.restore.sh"
attrib +a -s +h -r "%~dp0.env.restore.bat"
attrib +a -s +h -r "%~dp0.gitignore"
if exist "%~dp0.git" attrib -a -s +h -r "%~dp0.git"
copy /y "%~dp0.env\requirements.txt" "%~dp0" >nul
