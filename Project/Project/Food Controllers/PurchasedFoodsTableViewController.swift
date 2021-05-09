//
//  PurchasedFoodsTableViewController.swift
//  Project
//
//  Created by Ramy Hanafi on 3/23/21.
//

import UIKit

class PurchasedFoodsTableViewController: UITableViewController {
    
    var tabBar = FoodTabBarController()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var items = tabBar.localArrayOfFoods
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar = tabBarController as! FoodTabBarController

        //tableView.register(PurchasedFoodsTableViewCell.self, forCellReuseIdentifier: "PurchasedFoodsTableViewCellClass")
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func fetchItems(){
        do{
            self.items = try context.fetch(FoodItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            
        }
    }

    @IBAction func clearButtonPressed(_ sender: Any) {
        tabBar = tabBarController as! FoodTabBarController
        for item in items{
            tabBar.refundPurchase(price: item.price)
            self.context.delete(item)
            do {
                try self.context.save()
            }catch{
                
            }
            fetchItems()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchasedFoodsTableViewCellClass", for: indexPath)

        // Configure the cell...   
        if let actualCell = cell as? PurchasedFoodsTableViewCell{
            let rowNum = indexPath.row
            let theText = items[rowNum].name
            actualCell.theLabel.text = theText
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }*/
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tabBar = tabBarController as! FoodTabBarController
            tabBar.refundPurchase(price: items[indexPath.row].price)
            self.context.delete(items[indexPath.row])
            do {
                try self.context.save()
            }catch{
                
            }
            fetchItems()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let theDetailVC = segue.destination as? FoodDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
            let row = indexPath.row
            let name = items[row].name
            let cals = items[row].calories
            let price = items[row].price
            theDetailVC.theCals = String(cals)
            theDetailVC.theItem = name
            theDetailVC.thePrice = String(price)
        }
    }
    

}
