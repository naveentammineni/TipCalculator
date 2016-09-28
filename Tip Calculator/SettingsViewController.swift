//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Naveen Tammineni on 9/26/16.
//  Copyright © 2016 Naveen Tammineni. All rights reserved.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipSelector.selectedSegmentIndex = defaults.integer(forKey: "Tip")
        defaults.set(false, forKey: "changed")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func setDefaultTip(_ sender: AnyObject) {
        //Setting the tip with updated index and also updating the changed flag.
        defaults.set(tipSelector.selectedSegmentIndex, forKey: "Tip")
        defaults.set(true, forKey: "changed")
    }
}
