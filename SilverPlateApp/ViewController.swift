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
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

