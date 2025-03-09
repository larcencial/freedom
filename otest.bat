chcp 65001
cls
@echo off
color 4

echo.
powershell -Command "$fileContent = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/fafu.txt'; Write-Host $fileContent"
echo.

color 3
echo Installing wmic feature...
echo.
echo This is a one-time setup, and the installation time may vary depending on your internet and CPU speed. Do not shut down the system or script before the installation is complete, as this may cause Windows to crash.
timeout /t 3 /nobreak >nul
echo.
powershell -Command "DISM /Online /Add-Capability /CapabilityName:WMIC~~~~ | Write-Host"
echo.

cls

for /f "tokens=*" %%I in ('powershell -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set timestamp=%%I

if not exist "C:\FREEDOMAFU" (
    mkdir "C:\FREEDOMAFU"
)

set output_file="C:\FREEDOMAFU\FREEDOMAFU-SERIALREPORT_%timestamp%.txt"

cls

@echo off
color 4

echo.
powershell -Command "$fileContent = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/fafu.txt'; Write-Host $fileContent"
echo.

echo A TOOL TO RULE THEM ALL

echo.
echo Warning, some sections may be empty, this is not an issue
echo.
echo.
echo Script is working at the moment do not close
echo.
echo.
echo THE RESULTS WILL SAVE IN HERE:
echo.
echo.
echo %output_file% 
echo.

timeout /t 10 /nobreak >nul
cls

color 2

powershell -Command "$fileContent = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/fafu.txt'; Write-Host $fileContent" >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo =========================== >> %output_file%
echo =========================== >> %output_file%
echo = A TOOL TO RULE THEM ALL = >> %output_file%
echo =========================== >> %output_file%
echo =========================== >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
echo This file and its content are only stored on your computer and are not shared with any individual or organization. >> %output_file%
echo The reason for storing it is to allow you to check whether you encounter any issues after performing the spoofing operation. >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo -------------------------------------------------- >> %output_file%
echo **---------------- TEST DETAILS ----------------** >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Write-Host 'SERIAL REPORT DATE: ' $(Get-Date)" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "$ipInfo = Invoke-RestMethod -Uri 'https://ipinfo.io/json'; Write-Host 'IP ADRESS: ' $ipInfo.ip; Write-Host 'CITY: ' $ipInfo.city; Write-Host 'REGION: ' $ipInfo.region; Write-Host 'COUNTRY: ' $ipInfo.country; Write-Host 'LOCATION: ' $ipInfo.loc" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "$version = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/version.txt'; Write-Host 'FREEDOMAFU VERSION: ' $version" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo -------------------------------------------------- >> %output_file%
echo **---------------- TEST RESULTS ----------------** >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "if (Confirm-SecureBootUEFI) { Write-Host 'Secure Boot Status: Enabled' } else { Write-Host 'Secure Boot Status: Disabled' }" >> %output_file%
echo. >> %output_file%
echo Secure Boot may appear as disabled even when it is enabled if it shows as 'unloaded' in the BIOS. >> %output_file%
echo To fix this, you need to install the (default) Secure Boot keys from the BIOS >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Motherboard(BB) Serial Number: ' $_.SerialNumber}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_ComputerSystemProduct | ForEach-Object {Write-Host 'BIOS UUID: ' $_.UUID}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-WmiObject -Class Win32_BIOS | ForEach-Object {Write-Host 'BIOS Serial Number: ' $_.SerialNumber}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-WmiObject -Class Win32_Processor | ForEach-Object {Write-Host 'Processor ID: ' $_.ProcessorId}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "$productID = reg query 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion' /v ProductID; $productID = $productID | Select-String 'ProductID' | ForEach-Object { $_.Line.Split(' ')[-1] }; Write-Host 'Product ID Method1 : ' $productID" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "(reg query 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion' /v ProductId) | Select-String 'ProductId' | ForEach-Object { 'Product ID Method2 : ' + ($_ -split '\s{2,}')[3] }" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "$macAddress = getmac | Select-String -Pattern '\w{2}(-\w{2}){5}'; Write-Host 'MAC Address: ' $macAddress" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "$ramSerialNumber = Get-WmiObject -Class Win32_PhysicalMemory | Select-Object -ExpandProperty SerialNumber; Write-Host 'RAM Serial Number: ' $ramSerialNumber" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%

cls

setlocal enabledelayedexpansion

for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where "DriveType=3" get DeviceID /value') do (
    set "drive=%%a"
    if not "!drive!"=="" (
        echo Reading !drive!
        vol !drive!: 2>nul >> %output_file%
        if %errorlevel% equ 0 (
            echo !drive! succeeded
        ) else (
            echo !drive! failed
        )
        echo ---------------------------
    )
)

cls


echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_BIOS | ForEach-Object {Write-Host 'System UUID: ' $_.SerialNumber}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_ComputerSystem | ForEach-Object {Write-Host 'System Manufacturer: ' $_.Manufacturer}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'System Product: ' $_.Product}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_OperatingSystem | ForEach-Object {Write-Host 'System Version: ' $_.Version}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_BIOS | ForEach-Object {Write-Host 'System Serial Number: ' $_.SerialNumber}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_ComputerSystem | ForEach-Object {Write-Host 'System Family: ' $_.SystemFamily}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Baseboard Asset Tag: ' $_.AssetTag; Write-Host 'Baseboard Manufacturer: ' $_.Manufacturer; Write-Host 'Baseboard Product: ' $_.Product}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Baseboard Location in Chassis: ' $_.LocationInChassis}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Manufacturer: ' $_.Manufacturer}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Version: ' $_.Version}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Tag Number: ' $_.Tag}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Serial Key: ' $_.SerialNumber}" >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
echo Some sections may be empty, this is not an issue >> %output_file%
echo ======================================================================= >> %output_file%
echo. >> %output_file%
echo. >> %output_file%
echo ======================================================================= >> %output_file%
echo SAVED FILE LOCATION >> %output_file%
echo. >> %output_file%
echo %output_file% >> %output_file%
echo ======================================================================= >> %output_file%

cls

color 5

echo.
echo =======================================================================
echo The results have been saved here:
echo.
echo.
echo %output_file%
echo.
echo OPENING OUTPUT FILE
start notepad %output_file%
timeout /t 2 /nobreak >nul
echo =======================================================================
echo.
echo.
echo Process is finished closing in 5 seconds...
for /L %%i in (5,-1,1) do (
    echo %%i
    timeout /t 1 >nul
)

exit
