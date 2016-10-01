//
//  ShowSplashScreen.swift
//  Tip Calculator
//
//  Created by Naveen Tammineni on 9/30/16.
//  Copyright © 2016 Naveen Tammineni. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {

    @IBOutlet weak var percentageSign: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        percentageSign.layer.borderColor = UIColor.black.cgColor;
        percentageSign.layer.borderWidth = 3.0
        perform(Selector("showNavController"), with: nil, afterDelay: 1)
        
    }

    func showNavController(){
        performSegue(withIdentifier: "showSplashScreen", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
