//
//  BalanceViewController.swift
//  Project
//
//  Created by Ramy Hanafi on 4/7/21.
//

import UIKit
import CoreGraphics

class BalanceViewController: UIViewController {
   var tabBar = FoodTabBarController()
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var chartView: PieChartView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var balanceTextField: UITextField!
    var balance: Float = 0.0
    let formatter = NumberFormatter()
    @IBAction func editButnPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Enter your balance:", message: "Here you should enter the amount you wish to dedicate each month to food expenses.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Set Balance", style: UIAlertAction.Style.default){ _ in
            let textField = alert.textFields![0] as UITextField
            self.balance = Float(textField.text ?? "0.0")!
            self.tabBar.setBalance(amount: self.balance)
            self.loadView()
            let alert = UIAlertController(title: "Balance has been set!", message: "Your set balance will refresh when you return to the spending tab.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default){ _ in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true, completion: nil)
        })
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter balance:"
            textField.keyboardType = .numbersAndPunctuation
        })
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar = tabBarController as! FoodTabBarController
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        balanceTextField.text = formatter.string(from: NSNumber(value: tabBar.getBalance()))
        
        let pieChartView = PieChartView()
        pieChartView.frame = CGRect(x: 0, y: 0, width: chartView.frame.size.width, height: 300)
        pieChartView.segments = [
            Segment(color: .green, value: CGFloat(tabBar.getBalance())),
            Segment(color: .red, value: CGFloat(tabBar.getTotalSpent()))
        ]
        chartView.addSubview(pieChartView)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBar = tabBarController as! FoodTabBarController
        balanceTextField.text = String(tabBar.getBalance())

        let pieChartView = PieChartView()
        pieChartView.frame = CGRect(x: 0, y: 0, width: chartView.frame.size.width, height: 300)
        pieChartView.segments = [
            Segment(color: .green, value: CGFloat(tabBar.getBalance())),
            Segment(color: .red, value: CGFloat(tabBar.getTotalSpent()))
        ]
        chartView.addSubview(pieChartView)
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
