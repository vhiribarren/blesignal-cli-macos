# Bluetooth Signal

List ambiant Bluetooth Low Energy devices and their signal under macOS.
Developed using Swift and XCode as a macOS console app.

Its aim is to follow the signal evolution of a specific device, so it can be used with `grep` or other tools.

1st column: Unix timestamp date (number of seconds since 1970-01-01)  
2nd column: device ID as defined by macOS, since there is not possibility to display the MAC address.  
3rd column: RSSI, power of the signal, in dBm  
4th column: device name, if there is one.  

Example:

    $ ./blesignal
    -> Ctrl+C to leave
    -> BLE is powered on, starting BLE scan
    1536427421	1BA5BF21-DFA0-448C-BCE6-95A9ED62CB4B	-72	
    1536427422	5B6163D3-960A-4C93-8801-C034713D960B	-57	my_device
    1536427423	21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-74	
    1536427423	21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-72	
    1536427424	78DB2901-FEA0-410A-B79F-3EE6C7E812D4	-91	
    1536427425	78DB2901-FEA0-410A-B79F-3EE6C7E812D4	-91	
    1536427425	5B6163D3-960A-4C93-8801-C034713D960B	-58	my_device
    1536427425	5B6163D3-960A-4C93-8801-C034713D960B	-58	my_device
    1536427425	1BA5BF21-DFA0-448C-BCE6-95A9ED62CB4B	-73	


**Bonus: plot with gnuplot**

Under macOS, with gnuplot and stdbuf installed through Homebrew, to draw a realtime graph:

    $ brew install gnuplot --with-x11
    $ brew install coreutils feedgnuplot
    $ ./blesignal | grep --line-buffered my_device | stdbuf -oL  cut -f 1,3  | tee /dev/stderr | feedgnuplot --stream --lines --domain --set 'xdata time' --set "format x '%H:%M:%S'" --timefmt '%s'
