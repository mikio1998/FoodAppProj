//
//  AddFoodViewController.swift
//  Food Tracker
//
//  Created by Mikio Nakata on 9/10/19.
//  Copyright © 2019 Mikio Nakata. All rights reserved.
//
import Foundation
import UIKit
import FirebaseDatabase
import Firebase

class AddFoodViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var foodArray: [Food] = []
    
    //for searchBar filtering
    //for now I'm trying type food, I think i might want string though.
    var searchFood: [Food] = []
    
    // describing the searching status (for searchbar)
    // if user is using searchbar then true
    var searching: Bool = false
    
    //initializing the Search Controller
    //init with nil, to use the same view(as the search controller) to display the results.
    //let searchController = UISearchController(searchResultsController: nil)
    
    // variables for passing data thru confirm segue
    var confirmFood = ""
    var confirmCalories = ""
    var confirmCarbs = ""
    var confirmFat = ""
    var confirmProt = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Tryna live update new entries.....
//        let foodDB = Firestore.firestore()
//        //var query = foodDB.collection("foods");
//        foodDB.collection("foods")
//            .addSnapshotListener { querySnapshot, error in
//                guard (querySnapshot?.documents) != nil else {
//                    print("Error fetching documents: \(error!)")
//                    return
//                }

////                let cities = documents.map { $0["name"]! }
////                print("Current cities in CA: \(cities)")
//        }
        // but I can't yet....
        
        // Self Explanitory:
        firestoreToTableView()
    
        // Search Bar parameters
        
        //
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    
    // After new food entry added; Live list update
    // Update live (SnapShot Listner)
//    func reloadMenu () {
//        let foodDB = Firestore.firestore()
//        let foodRef = foodDB.collection("foods")
//            .addSnapshotListener { (querySnapshot, err) in
//
//                guard let collections = querySnapshot?.documents else {
//                    print("Error fetching documents: \(err!)")
//                    return
//                }
//                // i think I write something to update the new view here? i dont know how
//                //let foods = collections.map { (<#QueryDocumentSnapshot#>) -> T in
//                    <#code#>
//                }
//        }
//    }

    
    
    
    // I finally made this to work.
    // 1. Get firestore food collections
    // 2. Conversion of Collection Fields to Food Class
    // 3. Append each converted Collection to array...-> send to tableView loader
    func firestoreToTableView() {
        let foodDB = Firestore.firestore()
        let foodRef = foodDB.collection("foods")
        
        foodRef.getDocuments { (document, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                // Default example entries: food1 and food2 (Apple and Cookie)
                let food1 = Food(food: "Coffee", brand: "Nescafe", cal: 15, carb: 14, fat: 13, prot: 12)
                let food2 = Food(food: "Cookie", brand: "Cookie Shop", cal: 15, carb: 14, fat: 13, prot: 12)
                self.foodArray.append(food1)
                self.foodArray.append(food2)
                
                // "get" document Fields.
                for document in document!.documents {
                    //print("\(document.documentID) => \(document.data())")
                    
                    //accessing fields of document
                    let foodRe = document.get("food") as! String
                    let brandRe = document.get("brand") as! String
                    let calRe = document.get("cal") as! Int
                    let carbRe = document.get("carb") as! Int
                    let fatRe = document.get("fat") as! Int
                    let protRe = document.get("prot") as! Int
                    
                    print(foodRe)

                    // Document Fields converted to my Food Class.
                    let tempFood = Food(food: foodRe,
                                        brand: brandRe,
                                        cal: calRe,
                                        carb: carbRe,
                                        fat: fatRe,
                                        prot: protRe)
                    //append Food to array
                    self.foodArray.append(tempFood)
                }
                self.tableView.reloadData()
            }
        }
    }
}


// search bar funtionality
//In order for AddFoodViewController to respond to the search bar, it must implement UISearchResultsUpdating.
//This protocol defines methods to update search results based on information the user enters into the search bar.
extension AddFoodViewController: UISearchBarDelegate {
        

    //I dont think this runs!!!!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //filter original foodArray accourding to searchBar input
        searchFood = foodArray.filter({ $0.food.prefix(searchText.count) == searchText })
        
        //searchFood = foodArray.filter( { $0.food.contains(searchText) } )
        
        // is user is currently searching(using searchbar), searching Var is true
        searching = true
        
        //i always forget this
        tableView.reloadData()
        
    }
    
}

extension AddFoodViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // if user is searching, return filterArray count
        // if not searching, return the foodArray count
        if searching {
            print("printing lol")
            return searchFood.count
        } else {
            return foodArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // array of all DB Foods
        //let food = foodArray[indexPath.row]
        
        // array of filtered DB Foods (according to searchbar input)
        //let filterFood = searchFood[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! FoodCell
        
        //searching contitionals:
        // if user is using searchbar (true)...
        // then the tableView will be populated with the filtered Array (which is searchFood)
        // otherwise, populate with foodArray (all the food in DB)
        if searching {
            let filterFood = searchFood[indexPath.row]
            cell.setFood(food: filterFood)
        } else {
            
            let food = foodArray[indexPath.row]
            cell.setFood(food: food)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = self.foodArray[indexPath.row]

        confirmFood = food.food
        confirmCalories = "\(food.cal)"
        confirmCarbs = "\(food.carb)"
        confirmFat = "\(food.fat)"
        confirmProt = "\(food.prot)"

        tableView.deselectRow(at: indexPath, animated: true)

        performSegue(withIdentifier: "ConfirmFoodSegue", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ConfirmFoodSegue")
        {
            let vc = segue.destination as! ConfirmFoodViewController
            vc.food =  confirmFood
            vc.cal = confirmCalories
            vc.carb = confirmCarbs
            vc.fat = confirmFat
            vc.prot = confirmProt
        }

    }
    
}

