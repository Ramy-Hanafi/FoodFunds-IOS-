//
//  FoodPurchasedTableViewController.swift
//  Project
//
//  Created by Ramy Hanafi on 3/17/21.
//

import UIKit

class FoodPurchasedTableViewController: UITableViewController {
    var theModel = FoodPurchasedModel()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var purchases = theModel.listOfPurchases

    @IBOutlet weak var addBtnPressed: UIBarButtonItem!
    
    let transparentView = UIView()
    let optTableView = UITableView()
    var storeName: String?
    
    var selectedButton = UIBarButtonItem()
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        
        optTableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height,
                                    width: frames.width, height: 0)
        self.view.addSubview(optTableView)
        optTableView.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut,
                       animations: {self.transparentView.alpha = 0.5
                        self.optTableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height,
                                                         width: frames.width, height: 200)
                       }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {self.transparentView.alpha = 0.0}, completion: nil)
    
    }
    
    func alertHandler(text: String?) {
        storeName = text
        tableView.reloadData()
    }
    
    @IBAction func addButton(_ sender: Any) {
        selectedButton = addBtnPressed
        //addTransparentView(frames: addBtnPressed.accessibilityFrame)
        let alert = UIAlertController(title: "Enter store name", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Groceries", style: UIAlertAction.Style.default){ _ in
            let textField = alert.textFields![0] as UITextField
            self.storeName = textField.text ?? "Name"
            self.theModel.addPurchase(storeName: self.storeName, purchaseType: "Groceries")
            self.fetchItems()
        })
        alert.addAction(UIAlertAction(title: "Restaurant", style: UIAlertAction.Style.default){ _ in
            let textField = alert.textFields![0] as UITextField
            self.storeName = textField.text ?? "Name"
            self.theModel.addPurchase(storeName: self.storeName, purchaseType: "Restaurant")
            self.fetchItems()
        })
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter name:"
        })
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            self.purchases = try context.fetch(Purchases.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch {
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return purchases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodPurchasedTableViewCell", for: indexPath)

        // Configure the cell...
        if let actualCell = cell as? FoodPurchasedTableViewCell{
            let rowNum = indexPath.row
            let theText = purchases[rowNum].name
            let theType = purchases[rowNum].purchaseType
            actualCell.storeLabel.text = theText
            actualCell.typeLabel.text = theType
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.context.delete(purchases[indexPath.row])
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
