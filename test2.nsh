echo -on
goto SPOOFSERIAL
 
:SPOOFSERIAL
AMIDEEFIx64.efi /BS AUTO
goto SPOOFUUID
 
:SPOOFUUID
AMIDEEFIx64.efi /SU AUTO
goto EXIT
 
:EXIT
exit
goto END
 
:END
