//
//  ViewController.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/10/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Tryna send the data to these vars
    var calText: String = "00"
    var carbText = "00"
    var fatText = "00"
    var protText = "00"
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // for each, add original int and the sent int. Then convert to string.
        //cal.text = "\(calText)"
//        cal.text = calText
//        carb.text = protText
//        fat.text = fatText
//        prot.text = protText
        cal?.text = calText
        carb?.text = carbText
        fat?.text = fatText
        prot?.text = protText

    }
    //ConfirmFoodViewController.confirmFoodDelegate = self
    @IBOutlet weak var cal: UILabel?
    @IBOutlet weak var carb: UILabel?
    @IBOutlet weak var fat: UILabel?
    @IBOutlet weak var prot: UILabel?
    
    @IBAction func addFoodButton(_ sender: UIButton) {
        
    }
    
}

