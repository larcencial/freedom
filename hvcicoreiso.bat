chcp 65001
cls
@echo off
color 4

echo.
powershell -Command "$fileContent = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/larcencial/freedom/refs/heads/main/fafu.txt'; Write-Host $fileContent"
echo.

echo =======================================================================
powershell -Command "$result = Set-ProcessMitigation -System -Disable ForceRelocateImages; if ($?) { Write-Host 'Virtualization Status: Successfully Disabled' } else { Write-Host 'Virtualization Status: Failed to disable' }"
echo =======================================================================
echo.
echo.
echo =======================================================================
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart; if ($?) { Write-Host 'Hyper-V Successfully Disabled' } else { Write-Host 'Failed to disable Hyper-V' }"
echo =======================================================================
echo.
echo.
echo =======================================================================
powershell -Command "cmd /c 'bcdedit /set {current} hypervisorlaunchtype off && echo HypervisorLaunchType Successfully Disabled || echo Failed to disable HypervisorLaunchType'"
echo =======================================================================
echo.
echo.
echo =======================================================================
powershell -Command "cmd /c 'bcdedit /set hypervisorlaunchtype off && echo HypervisorLaunchType(M2) Successfully Disabled || echo Failed to disable HypervisorLaunchType(M2)'"
echo =======================================================================
echo.
echo.
echo =======================================================================
powershell -Command "Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\DeviceGuard' -Name 'EnableVirtualizationBasedSecurity' -Value 0; Write-Host 'VBS(Virtualization Based Security) Disabled Successfully'"
echo =======================================================================
echo.
echo.
echo =======================================================================
powershell.exe -Command "New-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Lsa' -Name 'LsaCfgFlags' -PropertyType DWORD -Value 0; if ($?) { Write-Host 'LsaCfgFlags Successfully Set to 0' } else { Write-Host 'Failed to set LsaCfgFlags' }"
echo =======================================================================
echo.
echo.

@echo off
echo =======================================================================
echo To apply the changes, you need to restart your computer.
echo =======================================================================
echo.
echo.
echo 1 - EXIT
echo 2 - RESTART PC
set /p choice=Choose an option (1 or 2): 

if "%choice%"=="1" (
    echo Exiting...
    exit
) else if "%choice%"=="2" (
    echo Restarting PC...
    shutdown /r /f /t 0
) else (
    echo Invalid choice, please select 1 or 2.
    pause
    exit
)
