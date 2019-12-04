//
//  Foods.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/11/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import Foundation
import UIKit

class Food {
    var food: String
    var brand: String
    
    var cal: Int
    var carb: Int
    var fat: Int
    var prot: Int
    
    init(food: String, brand: String, cal: Int, carb: Int, fat: Int, prot: Int) {
        self.food = food
        self.brand = brand
        self.cal = cal
        self.carb = carb
        self.fat = fat
        self.prot = prot
    }
    
    
}
