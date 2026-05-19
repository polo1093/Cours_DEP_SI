@echo off
setlocal EnableExtensions
title Activation RDP - universel langue FR/EN

echo ==========================================
echo Activation Bureau a distance / RDP
echo ==========================================
echo.

:: Verification admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERREUR : lance ce script en administrateur.
    pause
    exit /b 1
)

echo [1/5] Activation RDP dans le registre...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f >nul

echo [2/5] Configuration du port RDP sur 3389...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 3389 /f >nul

echo [3/5] Desactivation NLA pour compatibilite maximale en labo...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f >nul

echo [4/5] Activation du service RDP...
sc.exe config TermService start= auto >nul 2>&1
net start TermService >nul 2>&1

echo [5/5] Creation de regles pare-feu independantes de la langue...
netsh advfirewall firewall delete rule name="AUTO_RDP_TCP_3389" >nul 2>&1
netsh advfirewall firewall delete rule name="AUTO_RDP_UDP_3389" >nul 2>&1

netsh advfirewall firewall add rule name="AUTO_RDP_TCP_3389" dir=in action=allow protocol=TCP localport=3389 profile=any enable=yes >nul
netsh advfirewall firewall add rule name="AUTO_RDP_UDP_3389" dir=in action=allow protocol=UDP localport=3389 profile=any enable=yes >nul

echo.
echo Verification locale du port 3389 :
netstat -ano | findstr ":3389"

echo.
echo ==========================================
echo Termine.
echo Depuis le client, teste :
echo Test-NetConnection 192.168.33.135 -Port 3389
echo ==========================================
pause
