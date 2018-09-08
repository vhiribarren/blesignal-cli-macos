# Bluetooth Signal

List ambiant Bluetooth Low Energy devices and their signal under macOS.
Developed using Swift and XCode as a macOS console app.

Its aim is to follow the signal evolution of a specific device, so it can be used with `grep` or other tools.

First column is the device ID as defined by macOS, since there is not possibility to display the MAC address.

Second column is the RSSI, power of the singal

Third column is the device name, if there is one.

Example:


    $ ./blesignal
    -> Ctrl+C to leave
    -> BLE is powered on, starting BLE scan
    78DB2901-FEA0-410A-B79F-3EE6C7E812D4	-90 dBm	
    78DB2901-FEA0-410A-B79F-3EE6C7E812D4	-90 dBm	
    13C08CE1-53D8-4BB2-B947-D3949D71674C	-58 dBm	
    5B6163D3-960A-4C93-8801-C034713D960B	-63 dBm	my_device
    13C08CE1-53D8-4BB2-B947-D3949D71674C	-61 dBm	
    13C08CE1-53D8-4BB2-B947-D3949D71674C	-63 dBm	
    21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-76 dBm	
    21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-77 dBm	