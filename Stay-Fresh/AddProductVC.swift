//
//  AddProductViewController.swift
//  Stay-Fresh
//
//  Created by Dinaol Melak on 4/1/21.
//

import UIKit

class AddProductVC: UIViewController {
    let expireDatePicker = UIDatePicker()
    let localData = FetchData()
    var extractedExpireDate = Date()
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var expireDate: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createdatePicker()
    }
    
    @IBAction func onTapCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onTapAddProduct(_ sender: Any) {
        //Fetch Product Date
        if productValidator() == true{
            localData.saveLocalProducts(Name: productName.text!, Date: extractedExpireDate)
            dismiss(animated: true, completion: nil)
        }else{
            print("Please Dinaol check product again...")
        }
        
    }
    @IBAction func onTapScanDate(_ sender: Any) {
        print("Tapped Scan Date")
    }
    func productValidator()->Bool{
        
        if productName.text == nil || productName.text == ""{
            return false
        }else if expireDate.text == nil || expireDate.text == ""{
            return false
        }
        return true
    }
    func createdatePicker(){
        //create toolBar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        //create bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        //assign toolbar
        toolBar.setItems([doneButton], animated: true)
        expireDate.inputAccessoryView = toolBar
        //assign date picker to textfield
        expireDate.inputView = expireDatePicker
    }
    @objc func donePressed(){
        extractedExpireDate = expireDatePicker.date
        let formatter = DateFormatter()
        formatter.string(from: extractedExpireDate)
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        expireDate.text = formatter.string(from: expireDatePicker.date)
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
