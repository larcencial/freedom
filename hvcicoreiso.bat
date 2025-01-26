cls

color 90

powershell -Command "Set-ProcessMitigation -System -Disable Force"

bcdedit /set {current} hypervisorlaunchtype off

bcdedit /set hypervisorlaunchtype off

powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart"

powershell -Command "Set-ProcessMitigation -System -Disable Virtualization"

powershell.exe -Command "Set-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\DeviceGuard' -Name 'EnableVirtualizationBasedSecurity' -Value 0"

powershell.exe -Command "New-ItemProperty -Path 'HKLM:\\System\\CurrentControlSet\\Control\\Lsa' -Name 'LsaCfgFlags' -PropertyType DWORD -Value 0"

cls

echo YOU SHOULD RESTART YOUR COMPUTER
timeout 5
