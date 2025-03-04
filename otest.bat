chcp 65001
cls
@echo off
color 4

echo.
echo   FFFFF  RRRRR  EEEEE  EEEEE  DDDD   OOO   M   M    A    FFFFF  U   U
echo   F      R   R  E      E      D   D O   O  MM MM   A A   F      U   U
echo   FFFF   RRRRR  EEEE   EEEE   D   D O   O  M M M  AAAAA  FFFF   U   U
echo   F      R  R   E      E      D   D O   O  M   M  A   A  F      U   U
echo   F      R   R  EEEEE  EEEEE  DDDD   OOO   M   M  A   A  F      UUUUU
echo.
echo.
echo A TOOL TO RULE THEM ALL
echo.

color 3
echo Installing wmic feature...
echo.
echo This may take some time please wait
echo.
powershell -Command "DISM /Online /Add-Capability /CapabilityName:WMIC~~~~ | Write-Host"
echo.
cls

@echo off
color 4

echo.
echo   FFFFF  RRRRR  EEEEE  EEEEE  DDDD   OOO   M   M    A    FFFFF  U   U
echo   F      R   R  E      E      D   D O   O  MM MM   A A   F      U   U
echo   FFFF   RRRRR  EEEE   EEEE   D   D O   O  M M M  AAAAA  FFFF   U   U
echo   F      R  R   E      E      D   D O   O  M   M  A   A  F      U   U
echo   F      R   R  EEEEE  EEEEE  DDDD   OOO   M   M  A   A  F      UUUUU
echo.

echo A TOOL TO RULE THEM ALL

echo.
echo Warning, some sections may be empty, this is not an issue
echo Script is working at the moment do not close
echo.

timeout /t 5 /nobreak >nul
cls

color 2

echo.
echo   FFFFF  RRRRR  EEEEE  EEEEE  DDDD   OOO   M   M    A    FFFFF  U   U
echo   F      R   R  E      E      D   D O   O  MM MM   A A   F      U   U
echo   FFFF   RRRRR  EEEE   EEEE   D   D O   O  M M M  AAAAA  FFFF   U   U
echo   F      R  R   E      E      D   D O   O  M   M  A   A  F      U   U
echo   F      R   R  EEEEE  EEEEE  DDDD   OOO   M   M  A   A  F      UUUUU
echo.

echo...
echo..
echo.
echo A TOOL TO RULE THEM ALL
echo.
echo..
echo...

echo.
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Motherboard(BB) Serial Number: ' $_.SerialNumber}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_ComputerSystemProduct | ForEach-Object {Write-Host 'BIOS UUID: ' $_.UUID}"
echo.
powershell -Command "Get-WmiObject -Class Win32_BIOS | ForEach-Object {Write-Host 'BIOS Serial Number: ' $_.SerialNumber}"
echo.
powershell -Command "Get-WmiObject -Class Win32_Processor | ForEach-Object {Write-Host 'Processor ID: ' $_.ProcessorId}"
echo.
powershell -Command "$productID = reg query 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion' /v ProductID; $productID = $productID | Select-String 'ProductID' | ForEach-Object { $_.Line.Split(' ')[-1] }; Write-Host 'Product ID Method1 : ' $productID"
echo.
powershell -Command "(reg query 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion' /v ProductId) | Select-String 'ProductId' | ForEach-Object { 'Product ID Method2 : ' + ($_ -split '\s{2,}')[3] }"
echo.
powershell -Command "$macAddress = getmac | Select-String -Pattern '\w{2}(-\w{2}){5}'; Write-Host 'MAC Address: ' $macAddress"
echo.
powershell -Command "$ramSerialNumber = Get-WmiObject -Class Win32_PhysicalMemory | Select-Object -ExpandProperty SerialNumber; Write-Host 'RAM Serial Number: ' $ramSerialNumber"
echo.
setlocal enabledelayedexpansion

for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where "DriveType=3" get DeviceID /value') do (
    set "drive=%%a"
    if not "!drive!"=="" (
        echo Reading !drive!
        vol !drive!: 2>nul
        if %errorlevel% equ 0 (
            echo !drive! succeeded
        ) else (
            echo !drive! failed
        )
        echo ---------------------------
    )
)
echo.
powershell -Command "Get-CimInstance -ClassName Win32_BIOS | ForEach-Object {Write-Host 'System UUID: ' $_.SerialNumber}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_ComputerSystem | ForEach-Object {Write-Host 'System Manufacturer: ' $_.Manufacturer}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'System Product: ' $_.Product}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_OperatingSystem | ForEach-Object {Write-Host 'System Version: ' $_.Version}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_BIOS | ForEach-Object {Write-Host 'System Serial Number: ' $_.SerialNumber}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_ComputerSystem | ForEach-Object {Write-Host 'System Family: ' $_.SystemFamily}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Baseboard Asset Tag: ' $_.AssetTag; Write-Host 'Baseboard Manufacturer: ' $_.Manufacturer; Write-Host 'Baseboard Product: ' $_.Product}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Baseboard Location in Chassis: ' $_.LocationInChassis}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Manufacturer: ' $_.Manufacturer}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Version: ' $_.Version}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Tag Number: ' $_.Tag}"
echo.
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Serial Key: ' $_.SerialNumber}"
echo.


pause
