$RootPath = $PSScriptRoot
$env:Desactivate = "$RootPath\.virtualenv\Scripts\deactivate.bat"
$env:BankColition = "$RootPath\daemonBanKColition.ps1"

pip install --upgrade pip --no-warn-script-location --disable-pip-version-check
pip install virtualenv --no-warn-script-location --disable-pip-version-check

. "$RootPath\.virtualenv\Scripts\Activate.ps1"