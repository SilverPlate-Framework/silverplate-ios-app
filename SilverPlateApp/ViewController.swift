//
//  ViewController.swift
//  SilverPlateApp
//
//  Created by Jean-Christophe MELIKIAN on 15/02/2017.
//  Copyright © 2017 ozonePowered. All rights reserved.
//

import UIKit
import SilverPlate

class ViewController: UIViewController {
    @IBOutlet weak var netStatusLabel: UILabel!
    @IBOutlet weak var batteryLevelLabel: UILabel!
    @IBOutlet weak var batteryStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDevice.current.isBatteryMonitoringEnabled = true
        updateConnectivityState()
        updateBatteryState()
        
        // Easily manage your apps syncs and downloads !
        
        SilverPlate.shared.onInternetStateChanged = { (state) in
            self.updateConnectivityState()
            switch state {
            case .wifi:
                // Do some heavy downloads and syncs
                break
            case .cellular4g:
                // Do some syncs and downloads
                break
            case .cellular3g:
                // Easy on the downloads
                break
            case .cellular2g,
                 .none:
                // Don't even try to fetch anything from the web
                break
            }
        }
        
        // Be thoughtful and make your apps efficient !
        SilverPlate.shared.onBatteryStateChanged = { (state, level) in
            self.updateBatteryState()
            switch state {
            case .unplugged,
                 .unknown:
                // If unknown, let's assume it is unplugged
                break;
            case .charging:
                break;
            case .full:
                break;
            }
        }
        
    }
    
    func updateConnectivityState() {
        self.netStatusLabel.text = "Connectivity state: \(SilverPlate.shared.getReachabilityStatus())"
    }
    
    func updateBatteryState() {
        self.batteryStateLabel.text = "Battery state: \(SilverPlate.shared.getBatteryState())"
        self.batteryLevelLabel.text = "Battery level: \(SilverPlate.shared.getBatteryLevel())%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

