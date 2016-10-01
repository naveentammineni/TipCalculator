//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Naveen Tammineni on 9/26/16.
//  Copyright © 2016 Naveen Tammineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLable: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        let hasChanged = defaults.bool(forKey: "changed")
        let firstLoad = !defaults.bool(forKey: "firstLoad")
        //Loading the app for first time will select the 18% as default tip
        if(firstLoad){
            defaults.set(0, forKey: "Tip")
            defaults.set(true, forKey: "firstLoad")
        }
        //If the tip default has changed, recalculate the amount
        if(hasChanged) {
            tipControl.selectedSegmentIndex = defaults.integer(forKey: "Tip")
            calculateTip(self)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let tipPercentages = [0.18, 0.2, 0.22]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLable.text = formatter.string(from: NSNumber(value: total))
    }
}

