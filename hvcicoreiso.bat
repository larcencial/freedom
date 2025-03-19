chcp 65001
cls
@echo off
color 4
cls
echo.
powershell -Command "$fileContent = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/fafu.txt'; Write-Host $fileContent"
echo.
echo The script is working, please do not interrupt.
timeout /t 4 /nobreak >nul
echo.
echo.
echo =======================================================================
powershell -Command "$result = Set-ProcessMitigation -System -Disable ForceRelocateImages; if ($?) { Write-Host 'Virtualization Status: Successfully Disabled' } else { Write-Host 'Virtualization Status: Failed to disable' }"
echo =======================================================================
timeout /t 2 /nobreak >nul
echo.
echo.
echo =======================================================================
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart; if ($?) { Write-Host 'Hyper-V Successfully Disabled' } else { Write-Host 'Failed to disable Hyper-V' }"
echo =======================================================================
timeout /t 2 /nobreak >nul
echo.
echo.
echo =======================================================================
powershell -Command "cmd /c 'bcdedit /set {current} hypervisorlaunchtype off && echo HypervisorLaunchType Successfully Disabled || echo Failed to disable HypervisorLaunchType'"
echo =======================================================================
timeout /t 2 /nobreak >nul
echo.
echo.
echo =======================================================================
powershell -Command "cmd /c 'bcdedit /set hypervisorlaunchtype off && echo HypervisorLaunchType(M2) Successfully Disabled || echo Failed to disable HypervisorLaunchType(M2)'"
echo =======================================================================
timeout /t 2 /nobreak >nul
echo.
echo.
echo =======================================================================
powershell -Command "Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\DeviceGuard' -Name 'EnableVirtualizationBasedSecurity' -Value 0; Write-Host 'VBS(Virtualization Based Security) Disabled Successfully'"
echo =======================================================================
timeout /t 2 /nobreak >nul
echo.
echo.
echo =======================================================================
powershell.exe -Command "Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Lsa' -Name 'LsaCfgFlags' -Value 0; if ($?) { Write-Host 'LsaCfgFlags Successfully Set to 0' } else { Write-Host 'Failed to set LsaCfgFlags' }"
echo =======================================================================
timeout /t 2 /nobreak >nul
echo.
echo.

@echo off
echo =======================================================================
echo To apply the changes, you need to restart your computer.
echo =======================================================================
timeout /t 3 /nobreak >nul
echo.
echo.
echo 1 - EXIT
echo 2 - RESTART PC
set /p choice=Choose an option (1 or 2): 

if "%choice%"=="1" (
cls
echo.
powershell -Command "$fileContent = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/fafu.txt'; Write-Host $fileContent"
echo.
echo.
echo Exiting...
timeout /t 3 /nobreak >nul
exit
) else if "%choice%"=="2" (
cls
echo.
powershell -Command "$fileContent = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/fafu.txt'; Write-Host $fileContent"
echo.
echo.
echo Restarting PC...
timeout /t 3 /nobreak >nul
shutdown /r /f /t 0
) else (
cls
echo.
powershell -Command "$fileContent = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/fafu.txt'; Write-Host $fileContent"
echo.
echo.
echo Invalid Choice, exiting...
echo YOU NEED TO RESTART YOUR COMPUTER
timeout /t 3 /nobreak >nul
exit
)
