//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by Judy on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter Email and correct Password"
            return
        }
        
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid Email"
            return
        }
        
        SwiftSpinner.show("Sign up...")
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            SwiftSpinner.hide()
                    
            if(error != nil) {
                let casetedError = error! as NSError
                let firebaseError = casetedError.code
                self.lblStatus.text = "Error"
                print("error： " + String(firebaseError) + error!.localizedDescription)
                return
            }
            self.lblStatus.text = "Sign up successfully"
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
