//
//  FoodCell.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/11/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {

    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var calorieAmountLabel: UILabel!
    
    func setFood(food: Food) {
        foodNameLabel.text = food.food
        brandNameLabel.text = food.brand
        calorieAmountLabel.text = "\(food.cal)"
        
    }
    
//    func cellDetails(food: Food) -> Array<Any> {
//        var detailsArray = [String]()
//        detailsArray.append(food.food)
//        detailsArray.append(food.brand)
//        detailsArray.append("\(food.cal)")
//        //detailsArray = ["\(food.food)", "\(food.brand)", "\(food.cal)"]
//        
//        print(food.food)
//        print(food.brand)
//        
//        return detailsArray
//    }
    
    
    
}
