color /?
set /p "c=color>"
color %c%
if %errorlevel%==0 goto success
if NOT %errorlevel%==0 goto retry

:success
cls
more .\sysroot\verinf\success.dat
ping localhost -n 3 >nul
.\sedos.cmd

:retry
cls
more .\sysroot\verinf\fcerror.dat
ping localhost -n 3 >nul
.\xcuts\changecolor\changecolor.cmd