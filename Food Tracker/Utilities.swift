//
//  Utilities.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/30/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//

import Foundation
import UIKit


class Utilities {
    
    static func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
        return passwordTest.evaluate(with: password)
    }
    
}



//extension String {
//    enum ValidityType {
//        case age
////        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
////        case username
//
//        // Explaination https://stackoverflow.com/questions/39284607/how-to-implement-a-regex-for-password-validation-in-swift
////        case password = ^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$
//
//    }
//
//    enum Regex: String {
//        case age = "[0-9],{2,2}"
//    }
//
//
//    func isValid(_ vaildityType: ValidityType) -> Bool {
//        let format = ""
//        var regex = ""
//
//        switch vaildityType {
//        case .age:
//            regex = Regex.age.rawValue
//
//        }
//
//
//        return NSPredicate(format: format, regex).evaluate(with: self)
//    }
//
//
//}

    
    
