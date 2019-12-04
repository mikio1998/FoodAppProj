# FoodApp
Nutrition diary 

November 28th, 2019

This is the first version.
The goal is to document daily nutrition in a simple way. 

Work in progress state at the moment.

Is able to:
- Create personalized food entries 
  - Name, brand
  - Calories, Carbohydrates, Fat, Protein
  - Entries stored in Firestore DB
- Display selection of foods in table view.
  - Preview lists name of food, brand, calories
  - Selection of table view lists all the information
  - Search bar for convenience 
  
Is yet to be able to:
- Update food tableView realtime, after user creates new food entry.
- Button that confirms add food doesn't work as intended yet.
  - Root tableview (showing accumulated nutrition intake) can't read data from food confirmation
- Support user authentication 
  - Display User specific data
