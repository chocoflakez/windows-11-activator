@echo off
chcp 65001 >nul
title Activador Windows 11 (todas as versões) by chocoflakez
echo ****************************************** 
echo            Activador Windows 11            
echo ****************************************** 
echo A tentar activar o Windows...
echo.

:: Chaves de produto (Caso precise ver as mensagens, remova os `>nul`)
cscript //nologo c:\windows\system32\slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
cscript //nologo c:\windows\system32\slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
cscript //nologo c:\windows\system32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
cscript //nologo c:\windows\system32\slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9

:: Lista de servidores KMS
setlocal EnableDelayedExpansion
set i=1
set KMS_Servers[1]=kms.chinancce.com
set KMS_Servers[2]=NextLevel.uk.to
set KMS_Servers[3]=GuangPeng.uk.to
set KMS_Servers[4]=AlwaysSmile.uk.to
set KMS_Servers[5]=kms.shuax.com
set KMS_Servers[6]=kms8.msguides.com

:server
set KMS_Sev=!KMS_Servers[%i%]!
if "!KMS_Sev!"=="" goto fail

echo Tentando ativação com o servidor: !KMS_Sev!
cscript //nologo c:\windows\system32\slmgr.vbs /skms !KMS_Sev!
cscript //nologo c:\windows\system32\slmgr.vbs /ato | find /i "successfully activated" >nul && (
    echo.
    echo ****************************************** 
    echo  [✔] Windows 11 ativado com sucesso no servidor: !KMS_Sev!
    echo ****************************************** 
    echo.
    choice /n /c YN /m "Deseja reiniciar o PC agora [Y,N]? "
    if %errorlevel%==1 shutdown.exe /r /t 00
    exit
) || (
    echo [✖] Falha ao ativar neste servidor. Tentando outro...
    timeout /t 3 >nul
    set /a i+=1
    goto server
)

:fail
echo.
echo ****************************************** 
echo  [✖] Nenhum servidor KMS conseguiu ativar o Windows.  
echo  Verifique sua conexão e tente novamente.
echo ****************************************** 
echo.
pause
exit
