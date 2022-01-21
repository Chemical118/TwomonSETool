@echo off
setlocal enabledelayedexpansion
title EL TouchScreen Manager v1.0
cd C:\À¯Çö¿ì\multiscreen
:_loop
cls
devcon status "@HID\VID_1D02&PID_1214\2&311C56D8&0&0000" |find "running" >nul && set "st1=O" || set "st1=X"
devcon status "@HID\VID_1D02&PID_1211\2&30191C6F&0&0000" |find "running" >nul && set "st2=O" || set "st2=X"
devcon status "@HID\VID_1D02&PID_1213\2&1CE39E3B&0&0000" |find "running" >nul && set "st3=O" || set "st3=X"
echo +-----------+-----------+-----------+
echo ^| Display1  ^| Display2  ^| Display3  ^|
echo +-----------+-----------+-----------+
echo ^|     !st1!     ^|     !st2!     ^|     !st3!     ^|
echo +-----------+-----------+-----------+
echo.
echo 1) All Display ON
echo 2) All Display OFF
echo 3) Select Mode
echo 4) Quit Program
set /p mod=Choose what you want to do : 
if !mod! == 1 (
  set st1=O
  set st2=O
  set st3=O
  goto change
)
if !mod! == 2 (
  set st1=X
  set st2=X
  set st3=X
  goto change
)
if !mod! == 3 (
  set /p t=Display1 : 
  if /i !t! == O set st1=O
  if /i !t! == X set st1=X
  set /p t=Display2 : 
  if /i !t! == O set st2=O
  if /i !t! == X set st2=X
  set /p t=Display3 : 
  if /i !t! == O set st3=O
  if /i !t! == X set st3=X
  goto change
)
if !mod! == 4 (
  exit
)

goto _loop

:change
if !st1! == O (devcon enable "@HID\VID_1D02&PID_1214\2&311C56D8&0&0000" >nul 2>&1)
if !st1! == X (devcon disable "@HID\VID_1D02&PID_1214\2&311C56D8&0&0000" >nul 2>&1)
if !st2! == O (devcon enable "@HID\VID_1D02&PID_1211\2&30191C6F&0&0000" >nul 2>&1)
if !st2! == X (devcon disable "@HID\VID_1D02&PID_1211\2&30191C6F&0&0000" >nul 2>&1)
if !st3! == O (devcon enable "@HID\VID_1D02&PID_1213\2&1CE39E3B&0&0000" >nul 2>&1)
if !st3! == X (devcon disable "@HID\VID_1D02&PID_1213\2&1CE39E3B&0&0000" >nul 2>&1)
goto _loop