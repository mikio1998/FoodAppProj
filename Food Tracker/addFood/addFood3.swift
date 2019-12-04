//
//  addFood3.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 11/3/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import UIKit
import Firebase

class AddFood3: UIViewController {
    
    var nameText = ""
    var brandText = ""
    var calInt = ""
    var carbInt = ""
    var fatInt = ""
    var protInt = ""
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var protLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameText
        brandLabel.text = brandText
        calLabel.text = calInt
        carbLabel.text = carbInt
        fatLabel.text = fatInt
        protLabel.text = protInt
    }


    
    
    @IBAction func confirmAdd(_ sender: Any) {
        //Convert int types to string, for the DB
        let calInt1 = Int(calInt) ?? 0
        let carbInt1 = Int(carbInt) ?? 0
        let fatInt1 = Int(fatInt) ?? 0
        let protInt1 = Int(protInt) ?? 0
        
        //create reference of the DB
        let db = Firestore.firestore()
        //create the data in the DB!
        db.collection("foods").addDocument(data: ["food":nameText, "brand":brandText, "cal":calInt1, "carb":carbInt1, "fat":fatInt1, "prot":protInt1])
        
        
        //self.navigationController?.popToRootViewController(animated: true)
        //pops to specific view controller. viewControllers[1] is the second VC
        self.navigationController!.popToViewController(navigationController!.viewControllers[1], animated: true)
        print(nameText, brandText)
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
