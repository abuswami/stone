//
//  AuthViewController.swift
//  stone-prod
//
//  Created by Sunjeev Gururangan on 7/22/19.
//  Copyright © 2019 abuswaminathan. All rights reserved.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func handleLogin(_ sender: Any) {
        guard let email = emailField.text else {return}
        guard let pwd = passField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: pwd){ (user, error) in
            
            if error == nil && user != nil {//if no errors then allow login
                print("success!")
                //self.performSegue(withIdentifier: "loginToTab", sender: self) //Go to tab view page
            }else{
                print("login failed")
        }
        
    }
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
