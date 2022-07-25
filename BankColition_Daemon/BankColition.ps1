$RootPath = $PSScriptRoot

pip install -q -r .\script\requirements.txt

python $RootPath\script\loadCartolas.py