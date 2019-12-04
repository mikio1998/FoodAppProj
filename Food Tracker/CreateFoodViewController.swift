//
//  CreateFoodViewController.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/10/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import Foundation
import UIKit

class CreateFoodViewController: UIViewController {
    
    @IBOutlet weak var createFoodTableView1: UITableView!
    
    //@IBOutlet weak var createCell: CreateCell!
    
    
    @IBOutlet weak var createErrorLabel: UILabel!
    
    
    
    var createsArray: [Creates] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createsArray = createAnArray()
   
        createFoodTableView1.delegate = self
        createFoodTableView1.dataSource = self
 
    }
    
    
    func createAnArray() -> [Creates] {
        var tempArray: [Creates] = []
        
        //let theTitle = ["Brand Name", "Calories"]
        //let thePlaceholder = ["ex. Tropicana", "ex. 100"]
        //theTitle: Array = ["Brand Name"]
        
        //let BrandName = Creates
        
        let BrandName = Creates(cellTitle: "Brand", cellInput: "ex. Tropicana")
        
        let FoodName = Creates(cellTitle: "Name", cellInput: "Name your food!")
        
        let CalorieCount = Creates(cellTitle: "Calories", cellInput: "ex. 100")
        
        
        let CarbCount = Creates(cellTitle: "Carbs", cellInput: "ex. 100")
        
        let FatCount = Creates(cellTitle: "Fats", cellInput: "ex. 100")
        let ProteinCount = Creates(cellTitle: "Protein", cellInput: "ex. 100")
        
        
        
        tempArray.append(BrandName)
        tempArray.append(FoodName)
        tempArray.append(CalorieCount)
        tempArray.append(CarbCount)
        tempArray.append(FatCount)
        tempArray.append(ProteinCount)
        return tempArray
    }
    
    
    //check fields if data is correctly entered
    //returns nil if correct
    //returns error msg if error
    //func validateFields(tableview: UITableViewCell) -> Bool {
        // do error handling here later
        //if UITableViewCell.cellLabel? {
            //return "Fill In the Text Entries"
        //}
        //return nil
    }
    
    
    
    
    //@IBAction func createButtonTapped(_ sender: UIButton) {
        //TODO: handle errors, Read the tableview cells and check datatypes are correct
        //let error = validateFields()

        //if error != nil {
            // error label shows messege
            //return "Please check your entries."
            //self.createErrorLabel.text = "Error with entries"
            //self.createErrorLabel.alpha = 1

        //}
            
        //TODO:if no errors, write new food entry in DB
        //else {
            //write data
            
//        }
//
//
//    }
//
//
//}

var placeHolder: String = ""
var brand: String = ""


extension CreateFoodViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    //let brand = String!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return createsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let createCell = createsArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateCell") as! CreateCell
        
        
        cell.cellLabel.text = "\(createCell.cellTitle)"
        cell.inputField.placeholder = "\(createCell.cellInput)"
        return cell
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //let primaryPlaceholder = textField.placeholder
        //placeHolder = "\(textField.placeholder)"
        print("\(textField.placeholder!)" + "yeah")
        placeHolder = String(describing: textField.placeholder!)
        textField.placeholder = nil
    }

        
    func textFieldDidEndEditing(_ textField: UITextField, cellForRowAt indexPath: IndexPath) {
        textField.placeholder = placeHolder
        
        //when end editing, assign texField text to appropriate data category
        // ie. to brand, calories, etc.
        
        print(placeHolder)
        print("asdkjfoi")
        

    }
    
    
}

