# Bluetooth Signal

List ambiant Bluetooth Low Energy devices and their signal under macOS.
Developed using Swift and XCode as a macOS console app.

Its aim is to follow the signal evolution of a specific device, so it can be used with `grep` or other tools.

1st column: RFC3339 collection date.  
2nd column: device ID as defined by macOS, since there is not possibility to display the MAC address.  
3rd column: RSSI, power of the signal, in dBm.  
4th column: device name, if there is one.  

Example:


    $ ./blesignal
    -> Ctrl+C to leave
    -> BLE is powered on, starting BLE scan
    2018-09-08T11:56:35.086+02:00	2CB6EC65-12AC-459B-97CF-9126104AF6E4	-87	
    2018-09-08T11:56:35.093+02:00	2CB6EC65-12AC-459B-97CF-9126104AF6E4	-87	LE-Bose QC35 II
    2018-09-08T11:56:35.339+02:00	7233727F-B83F-4FB6-A783-C28850890B6D	-58	my_device
    2018-09-08T11:56:35.342+02:00	7233727F-B83F-4FB6-A783-C28850890B6D	-58	my_device
    2018-09-08T11:56:36.589+02:00	21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-74	
    2018-09-08T11:56:36.835+02:00	21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-75	
    2018-09-08T11:56:37.145+02:00	21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-75	
    2018-09-08T11:56:38.403+02:00	AA11AC5E-DE9C-48F0-8455-45A2746B05E2	-75	
