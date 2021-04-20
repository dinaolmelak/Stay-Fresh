//
//  LogInViewController.swift
//  Stay-Fresh
//
//  Created by Dinaol Melak on 3/24/21.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var messageDisplayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageDisplayLabel.alpha = 0.0
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "LoggedIn") == true{
                    performSegue(withIdentifier: "LoggedInSegue", sender: self)
        }
    }
    @IBAction func onTapGoogle(_ sender: Any) {
        print("google")
        messageDisplayLabel.text = "google"
    }
    @IBAction func onTapFacebook(_ sender: Any) {
        print("Facebook")
        messageDisplayLabel.text = "Facebook"
    }
    
    @IBAction func onTapApple(_ sender: Any) {
        print("Apple")
        messageDisplayLabel.text = "Apple"
    }
    @IBAction func onTapSkip(_ sender: Any) {
        print("Skip Sign In")
        messageDisplayLabel.text = "Skip Sign In"
        performSegue(withIdentifier: "LoggedInSegue", sender: self)
        UserDefaults.standard.set(true, forKey: "LoggedIn")
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
