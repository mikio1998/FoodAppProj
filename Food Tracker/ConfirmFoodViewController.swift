//
//  ConfirmFoodViewController.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/10/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import Foundation
import UIKit

// protocol instructions for passing confirmFood data back to rootVC
protocol dailyNutritionDelegate {
    //func didConfirmFood(cal: Int, carb: Int, fat: Int, prot: Int)
    func didConfirmFood(cal : String)
}

class ConfirmFoodViewController: UIViewController {
    
    
    // create variable holding confirmFood data Delegate
    //var confirmFoodDelegate: dailyNutritionDelegate?
    var confirmFoodDelegate: dailyNutritionDelegate?
    //let foodValues : Bool = true
    
    var food = "0"
    var cal = "0"
    var carb = "0"
    var fat = "0"
    var prot = "0"
    
    
    func cellDetails(food: Food) -> Array<Any> {
        var detailsArray = [String]()
        detailsArray.append(food.food)
        detailsArray.append(food.brand)
        detailsArray.append("\(food.cal)")

        print(food.food)
        print(food.brand)
        return detailsArray
    }
    
    
    @IBOutlet weak var foodName: UILabel?
    @IBOutlet weak var calorieAmount: UILabel?
    @IBOutlet weak var carbAmount: UILabel?
    @IBOutlet weak var fatAmount: UILabel?
    @IBOutlet weak var proteinAmount: UILabel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodName?.text = food
        calorieAmount?.text = cal
        carbAmount?.text = carb
        fatAmount?.text = fat
        proteinAmount?.text = prot
    }
    
    
    var rootVCInstance = ViewController()
    func passDataWithPop(cal: Int, carb: Int, fat: Int, prot: Int) -> String {
        let rootVC = ViewController()
        
        // root + new = updated Nutrition
        
        // root
        let rootCal = Int(rootVC.calText) ?? 0
        
        // update
        let newCal = "\(rootCal + cal)"
        
        //rootVC.calText = newCal
        return newCal
    }

    
    
    @IBAction func addConfirmedButton(_ sender: Any) {
        let rootViewCont = ViewController()
        rootViewCont.calText = "Hello"
        rootViewCont.cal?.text = "Hi"
        let cal: String = "55"
        
        
        
        if confirmFoodDelegate != nil {
            confirmFoodDelegate?.didConfirmFood(cal: cal)
        }
        
        navigationController!.popToRootViewController(animated: true)
       
        
        
//        let calInt = Int(cal)
//        let carbInt = Int(carb)
//        let protInt = Int(prot)
//        let fatInt = Int(fat)
        
        // NOW UPDATE rootVC LABELS
    
    }
    
    
}
