import Foundation
import CoreBluetooth


class BTScanInteractor : NSObject, CBCentralManagerDelegate{
    
    let centralManager: CBCentralManager
    
    override init() {
        self.centralManager = CBCentralManager(delegate: nil, queue: nil)
        super.init()
        self.centralManager.delegate = self
    }
    
    func startScan() -> Void {
        centralManager.scanForPeripherals(withServices: nil , options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
    }
    
    func stopScan() -> Void {
        centralManager.stopScan()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            printStderr("BLE is powered off")
        case .poweredOn:
            if !centralManager.isScanning {
                printStderr("BLE is powered on, starting BLE scan")
                startScan()
            }
        case .resetting:
            printStderr("BLE is resetting")
        case .unauthorized:
            printStderr("BLE is not authorized")
        case .unknown:
            printStderr("Unknown BLE problem")
        case .unsupported:
            printStderr("BLE is not supported")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let time = Date().timeIntervalSince1970
        printStdout("\(time)\t\(peripheral.identifier)\t\(RSSI)\t\(peripheral.name ?? "")")
    }
    
}

