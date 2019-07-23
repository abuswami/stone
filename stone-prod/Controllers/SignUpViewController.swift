//
//  SignUpViewController.swift
//  stone-prod
//
//  Created by Sunjeev Gururangan on 7/21/19.
//  Copyright © 2019 abuswaminathan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

   
   
    

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var bdayField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSignup(_ sender: Any) {
        
        guard let email = emailField.text else{return}
        guard let pwd = pwdField.text else{return}
        guard let bday = bdayField.text else{return}
        
        Auth.auth().createUser(withEmail: email, password: pwd){
            user, error in
            
            if error == nil && user != nil { //if no errors then create user
                print("user created")
                self.saveUserToFirebase( email: email, bday: bday)
                print("account saved")
            }
        }
    }
        
        private func saveUserToFirebase(email: String, bday: String){
            let db = Firestore.firestore()
            
            guard let userId = Auth.auth().currentUser?.uid else {return}
            
            let likedVendors: [String] = []
            let likedProducts: [String] = []
            
            
            let values = [ "email" : email,
                          "bday" : bday,
                    "likedVendors" :  likedVendors,
                          "likedProducts" : likedProducts
                ] as [String : Any]
            
            db.collection("users").document(userId).setData(values, merge: true)
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

