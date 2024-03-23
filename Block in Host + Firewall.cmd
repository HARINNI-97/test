@echo off
set ver=v1
title Block in Firewall _ Empire Impress
fltmc >nul 2>&1 || (
  echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdmin.vbs"
  echo UAC.ShellExecute "%~fs0", "", "", "runas", 1 >> "%temp%\GetAdmin.vbs"
  cmd /u /c type "%temp%\GetAdmin.vbs">"%temp%\GetAdminUnicode.vbs"
  cscript //nologo "%temp%\GetAdminUnicode.vbs"
  del /f /q "%temp%\GetAdmin.vbs" >nul 2>&1
  del /f /q "%temp%\GetAdminUnicode.vbs" >nul 2>&1
  exit
)

@echo off
SET hosts=%windir%\system32\drivers\etc\hosts
attrib -r %hosts%
echo. >>%hosts%
FOR %%A IN (

lmlicenses.wip4.adobe.com
lm.licenses.adobe.com
na1r.services.adobe.com
hlrcv.stage.adobe.com
practivate.adobe.com
activate.adobe.com
lm-prd-da1.licenses.adobe.com
activate.wip4.adobe.com
practivate-da1.adobe.com
uds.licenses.adobe.com
licenses.adobe.com
license.adobe.com
helpexamples.com
activate-sea.adobe.com
activate-sjc0.adobe.com
ereg.adobe.com
activate.adobe.com
na1r.services.adobe.com
activate.wip3.adobe.com
wip3.adobe.com
ereg.wip3.adobe.com
wwis-dubc1-vip60.adobe.com


) DO (
    findstr /i /c:"127.0.0.1 %%A" %hosts% >nul || (
        echo 127.0.0.1 %%A >>%hosts%
    )
)
attrib +r %hosts%
echo.
echo.
echo Successfully Blocked Host

@echo off
netsh advfirewall firewall add rule name="acrocef.exe" dir=out program="C:\program files\adobe\acrobat dc\acrobat\acrocef_1\acrocef.exe" action=block
netsh advfirewall firewall add rule name="crwindowsclientservice.exe" dir=out program="C:\program files\adobe\acrobat dc\acrobat\crwindowsclientservice.exe" action=block
netsh advfirewall firewall add rule name="acrobat.exe" dir=out program="C:\program files\adobe\acrobat dc\acrobat\acrobat.exe" action=block
netsh advfirewall firewall add rule name="adobe crash processor.exe" dir=out program="C:\program files\adobe\acrobat dc\acrobat\adobe crash processor.exe" action=block

echo Successfully Blocked Programs
echo.
@ECHO ~~~~~~~~~~~~~~~~~~~~~~ Made With ♡ By Empire Impress ~~~~~~~~~~~~~~~~~~~~~~
echo.
@PAUSE 