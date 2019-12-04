//
//  addFood1.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 11/3/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import UIKit

class AddFood1: UIViewController {

    @IBOutlet weak var nameFood: UITextField!
    @IBOutlet weak var nameBrand: UITextField!
    
    var nameText = "Food_Entry"
    var brandText = "Brand_Entry"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func nextButton(_ sender: Any) {
        
        //fill in the variables with the text input
        
//        if self.nameText != "" {
//            self.nameText = nameFood.text ?? ""
//            self.brandText = nameBrand.text ?? ""
//            self.performSegue(withIdentifier: "firstSeg", sender: self)
//
//        } else {
//            nameFood.attributedPlaceholder = NSAttributedString(string: "Required!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
//        }
        
        self.nameText = nameFood.text ?? ""
        self.brandText = nameBrand.text ?? ""
        //**segue is performed automatically, because you linked(drag dropped) it on the storyboard
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? AddFood2
        vc?.nameText = self.nameText
        vc?.brandText = self.brandText
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
