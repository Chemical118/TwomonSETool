cd "C:\À¯Çö¿ì\multiscreen"
devcon status "@HID\VID_1D02&PID_1213\2&1CE39E3B&0&0000" |find "running" >nul && set "status=running" || set "status=disabled"
IF "%status%" == "running" (
  devcon disable "@HID\VID_1D02&PID_1213\2&1CE39E3B&0&0000"
) ELSE (
  devcon enable "@HID\VID_1D02&PID_1213\2&1CE39E3B&0&0000"
)