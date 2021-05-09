//
//  FoodDetailViewController.swift
//  Project
//
//  Created by Ramy Hanafi on 3/23/21.
//

import UIKit

class FoodDetailViewController: UIViewController {
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var theNavBar: UINavigationItem!
    @IBOutlet weak var thePriceTextField: UITextField!
    var theItem: String?
    var theCals: String?
    var thePrice: String?
    @IBOutlet weak var calorieTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemTextField.text = theItem
        calorieTextField.text = theCals
        thePriceTextField.text = "$\(thePrice!)"
        theNavBar.title = theItem
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
