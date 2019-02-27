//
//  ThirdViewController.swift
//  GusserApp
//
//  Created by student on 2/27/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var minValue: UITextField!
    @IBOutlet weak var maxValue: UITextField!
    @IBOutlet weak var meanValue: UITextField!
    @IBOutlet weak var stdDevValue: UITextField!
    
    @IBAction func clearstat(_ sender: Any) {
        let guess1 = Guesser.shared
        minValue.text = ""
        maxValue.text = ""
        meanValue.text = ""
        stdDevValue.text = ""
        guess1.clearStatistics()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let guess1 = Guesser.shared
        minValue.text = "\(guess1.minNumberOfAttempts())"
        maxValue.text = "\(guess1.maxNumberOfAttempts())"
        meanValue.text = String(format : "%0.1f",(guess1.calculateMean()))
        stdDevValue.text = String(format : "%0.1f",(guess1.calcStandardDev()))
        // Do any additional setup after loading the view.
    }
    

   

}
