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

powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Motherboard(BB) Serial Number: ' $_.SerialNumber}"
powershell -Command "Get-CimInstance -ClassName Win32_BIOS | ForEach-Object {Write-Host 'System UUID: ' $_.SerialNumber}"
powershell -Command "Get-CimInstance -ClassName Win32_ComputerSystem | ForEach-Object {Write-Host 'System Manufacturer: ' $_.Manufacturer}"
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'System Product: ' $_.Product}"
powershell -Command "Get-CimInstance -ClassName Win32_OperatingSystem | ForEach-Object {Write-Host 'System Version: ' $_.Version}"
powershell -Command "Get-CimInstance -ClassName Win32_BIOS | ForEach-Object {Write-Host 'System Serial Number: ' $_.SerialNumber}"
powershell -Command "Get-CimInstance -ClassName Win32_ComputerSystem | ForEach-Object {Write-Host 'System Family: ' $_.SystemFamily}"
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Baseboard Asset Tag: ' $_.AssetTag; Write-Host 'Baseboard Manufacturer: ' $_.Manufacturer; Write-Host 'Baseboard Product: ' $_.Product}"
powershell -Command "Get-CimInstance -ClassName Win32_BaseBoard | ForEach-Object {Write-Host 'Baseboard Location in Chassis: ' $_.LocationInChassis}"
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Manufacturer: ' $_.Manufacturer}"
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Version: ' $_.Version}"
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Tag Number: ' $_.Tag}"
powershell -Command "Get-CimInstance -ClassName Win32_SystemEnclosure | ForEach-Object {Write-Host 'Chassis Serial Key: ' $_.SerialNumber}"

pause
