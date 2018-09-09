# Bluetooth Signal

List ambiant Bluetooth Low Energy devices and their signal under macOS.
Developed using Swift and XCode as a macOS console app.

Its aim is to follow the signal evolution of a specific device, so it can be used with `grep` or other tools.

1st column: Unix timestamp date (number of seconds since 1970-01-01) with milliseconds as decimals
2nd column: device ID as defined by macOS, since there is not possibility to display the MAC address.  
3rd column: RSSI, power of the signal, in dBm  
4th column: device name, if there is one.  

Example:

    $ ./blesignal
    -> Ctrl+C to leave
    -> BLE is powered on, starting BLE scan
    1536476283.13999	67E5542F-E7AE-4D56-826A-84D7459324B9	-98	
    1536476283.17563	7233727F-B83F-4FB6-A783-C28850890B6D	-63	my_device
    1536476283.18404	7233727F-B83F-4FB6-A783-C28850890B6D	-63	my_device
    1536476283.46574	5C8FAB4E-5953-4DAE-B293-B9918BCF08C5	-68	
    1536476283.46768	5C8FAB4E-5953-4DAE-B293-B9918BCF08C5	-68	
    1536476283.77264	21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-93	
    1536476284.08763	21CF8BD5-734F-4A04-9C12-A8028B7E7E6B	-92	
    1536476285.33319	5C8FAB4E-5953-4DAE-B293-B9918BCF08C5	-68	
    1536476285.88261	78DB2901-FEA0-410A-B79F-3EE6C7E812D4	-84	
    1536476286.19359	7233727F-B83F-4FB6-A783-C28850890B6D	-63	my_device


**Bonus: plot with gnuplot**

Under macOS, with gnuplot and stdbuf installed through Homebrew, to draw a realtime graph:

    $ brew install gnuplot --with-x11
    $ ./blesignal | grep --line-buffered my_device > data.plot &
    $ gnuplot -p -e "set term x11 noraise; set xdata time; set timefmt '%s'; set format x '%H:%M:%S' ; plot 'data.plot' using 1:3 with lines;  while(1) { ; replot; pause 2; }"
