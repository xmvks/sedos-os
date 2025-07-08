goto mn

:mn
more .\sysroot\class\4.cl
set /p "wb=>> "
if %wb%==1 goto cp
if %wb%==2 goto cra
if %wb%==3 goto dp
if %wb%==4 goto perms
if %wb%==0 goto back

:back
start sedos.cmd

:cp
attrib -h -s .\sysroot\usr\%username%\*.pws
set /p "nps=New Password for %username% > "
rename *.pws %nps%.pws
cls
goto mn

:cra
dir .\sysroot\usr\
pause
cls
goto mn

:dp
del .\sysroot\usr\%username%\*.pws /f
goto mn

:perms
dir .\sysroot\usr\%username%\acinfo\
pause
goto mn