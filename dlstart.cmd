cd "C:\À¯Çö¿ì\multiscreen"
taskkill /IM "EL_Display_Hub.exe" /F /FI "STATUS eq RUNNING"
taskkill /IM "EL_Display_service.exe" /F /FI "STATUS eq RUNNING"
taskkill /IM "EL_Display_service_proc.exe" /F /FI "STATUS eq RUNNING"
devcon enable "@HID\VID_1D02&PID_1214\2&311C56D8&0&0000" 
devcon enable "@HID\VID_1D02&PID_1211\2&30191C6F&0&0000"
devcon enable "@HID\VID_1D02&PID_1213\2&1CE39E3B&0&0000"
start "" "EL Display Hub.lnk"
timeout /t 5
devcon disable "@HID\VID_1D02&PID_1214\2&311C56D8&0&0000" 
devcon disable "@HID\VID_1D02&PID_1211\2&30191C6F&0&0000"
devcon disable "@HID\VID_1D02&PID_1213\2&1CE39E3B&0&0000"
exit
