@echo off
set RootPath=%mypath%

pip install -q -r .\script\requirements.txt

python script\loadCartolas.py