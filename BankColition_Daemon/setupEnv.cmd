@echo off
set RootPath=%mypath%
set Desactivate=%RootPath%\.virtualenv\Scripts\deactivate.bat
set BankColition=%RootPath%\daemonBankColition.cmd

python -m pip install --upgrade pip --no-warn-script-location --disable-pip-version-check
pip install virtualenv --no-warn-script-location --disable-pip-version-check

.virtualenv\Scripts\activate.bat