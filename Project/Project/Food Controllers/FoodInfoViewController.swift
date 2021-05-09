//
//  FoodInfoViewController.swift
//  Project
//
//  Created by Ramy Hanafi on 3/19/21.
//

import UIKit

class FoodInfoViewController: UIViewController, UITextFieldDelegate {
    var tabBar = FoodTabBarController()
    
    @IBOutlet weak var theTextField: UITextField!
    @IBOutlet weak var theButton: UIButton!
    @IBOutlet weak var thePriceTextField: UITextField!
    @IBAction func buttonPressed(_ sender: Any) {
        let theActualText = theTextField.text
        var urlString = theActualText!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let thePrice = Float(thePriceTextField.text!)
        tabBar.createURL(searchTerm: urlString!, price: thePrice)
        theTextField.text = ""
        thePriceTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar = tabBarController as! FoodTabBarController

        self.theTextField.delegate = self
        self.thePriceTextField.delegate = self


        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let theTableVC = segue.destination as? PurchasedFoodsTableViewController {
            //theTableVC.theModel = theModel
         
        }
    }
    

}
