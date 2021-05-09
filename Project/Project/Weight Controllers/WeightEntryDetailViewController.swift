//
//  WeightEntryDetailViewController.swift
//  Project
//
//  Created by Ramy Hanafi on 4/2/21.
//

import UIKit

class WeightEntryDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var weightEntry: UITextField!
    @IBOutlet weak var dateText: UITextField!
    var weight: String?
    var date: String?
    var imageKey: String?
    let defaults = UserDefaults.standard
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var progressImgView: UIImageView!
    
    @IBAction func photoButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true){
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            progressImgView.image = image
            let imageData = image.pngData()! as NSData
            defaults.set(imageData, forKey: imageKey!)
        }else{
            
        }
        self.dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        weightEntry.text = weight
        dateText.text = date
        navBar.title = date
        
        if defaults.object(forKey: imageKey!) == nil{
            
        }else{
            let data = defaults.object(forKey: imageKey!) as! NSData
            progressImgView.image = UIImage(data: data as Data)
        }

        // Do any additional setup after loading the view.
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
