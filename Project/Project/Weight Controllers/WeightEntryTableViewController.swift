//
//  WeightEntryTableViewController.swift
//  Project
//
//  Created by Ramy Hanafi on 4/2/21.
//

import UIKit

class WeightEntryTableViewController: UITableViewController {
    let theModel = WeightEntryModel()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var entries = theModel.listOfWeightEntries
    
    var weight: Float = 0.0
    let date = Date()
    
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Enter your weight", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Add Entry", style: UIAlertAction.Style.default){ _ in
            let textField = alert.textFields![0] as UITextField
            self.weight = Float(textField.text ?? "0.0")!
            self.theModel.addEntry(enteredWeight: self.weight, theDate: self.date)
            self.fetchItems()
        })
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter weight:"
            textField.keyboardType = .numbersAndPunctuation
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
            self.entries = try context.fetch(WeightEntry.fetchRequest())
            
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
        return entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeightEntryTableViewCell", for: indexPath)

        // Configure the cell...
        if let actualCell = cell as? WeightEntryTableViewCell{
            let rowNum = indexPath.row
            //let theDate = getDate(date: date)
            let theText = "Entry on \(getDate(date: entries[rowNum].date))"
            actualCell.theLabel.text = theText
        }

        return cell
    }
    
    func getDate(date: Date?) ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let result = formatter.string(from: date!)
        return result
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
            self.context.delete(entries[indexPath.row])
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
        if let theDetailVC = segue.destination as? WeightEntryDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
            let row = indexPath.row
            let theWeight = entries[row].weight
            let theDate = entries[row].date
            let imageNum = "Image" + String(row)
            theDetailVC.weight = String(theWeight)
            theDetailVC.date = getDate(date: theDate)
            theDetailVC.imageKey = imageNum
        }
    

    }
}
