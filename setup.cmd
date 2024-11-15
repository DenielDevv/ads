@echo off
echo Pyobd telepito script
echo =====================

:: Python verzio ellenorzese
python --version > nul 2>&1
if errorlevel 1 (
    echo Python nincs telepitve! Kerem telepitse a Python 3.11-et innen: https://www.python.org/downloads/
    pause
    exit /b 1
)

:: Virtualis kornyezet letrehozasa
echo Virtualis kornyezet letrehozasa...
python -m venv venv
call venv\Scripts\activate

:: Pip frissitese
echo Pip frissitese...
python -m pip install --upgrade pip

:: Szukseges csomagok telepitese
echo Csomagok telepitese...
pip install wxPython
pip install numpy==1.26.4
pip install pint==0.18
pip install obd
pip install pyserial

:: Program inditasa
echo Program inditasa...
python pyobd.py

:: Ha hiba tortent, varjunk
if errorlevel 1 (
    echo Hiba tortent a program futasa kozben!
    pause
)

deactivate