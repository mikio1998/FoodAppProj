//
//  addFood2.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 11/3/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import UIKit

class AddFood2: UIViewController {
    
    @IBOutlet weak var calTextField: UITextField!
    
    @IBOutlet weak var carbTextField: UITextField!
    @IBOutlet weak var fatTextField: UITextField!
    
    @IBOutlet weak var protTextField: UITextField!
    
    
    var nameText = ""
    var brandText = ""
    var calInt = ""
    var carbInt = ""
    var fatInt = ""
    var protInt = ""
    
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    
    override func viewDidLoad() {
        foodLabel.text = nameText
        brandLabel.text = brandText
        super.viewDidLoad()
    }

    @IBAction func nextButton(_ sender: Any) {
        //self.nameText = nameText
        //self.brandText = nameBrand.text ?? ""
        
        //Int in String form, for now!
        self.calInt = calTextField.text ?? ""
        self.carbInt = carbTextField.text ?? ""
        self.fatInt = fatTextField.text ?? ""
        self.protInt = protTextField.text ?? ""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? AddFood3
        vc?.nameText = self.nameText
        vc?.brandText = self.brandText
        vc?.calInt = self.calInt
        vc?.carbInt = self.carbInt
        vc?.fatInt = self.fatInt
        vc?.protInt = self.protInt
        
        
    }
    
    
}
