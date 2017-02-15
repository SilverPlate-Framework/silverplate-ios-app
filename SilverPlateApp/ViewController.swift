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

    override func viewDidLoad() {
        super.viewDidLoad()
        SilverPlate.shared.onInternetStatusChanged = { (status) in
            
            self.netStatusLabel.text = "Connectivity status: \(status)"
            
            switch status {
            case SilverPlate.Network.wifi:
                // Do some heavy download
                break
            case SilverPlate.Network.cellular:
                // Now easy with the data load
                break
            case SilverPlate.Network.none:
                // Don't try to fetch anything from the web
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

