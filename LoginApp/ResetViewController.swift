//
//  ResetViewController.swift
//  LoginApp
//
//  Created by Judy on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class ResetViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetPassword(_ sender: Any) {
        let email = txtEmail.text
        
        if !email!.isEmail {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        SwiftSpinner.show("Sending reset link...")
        Auth.auth().sendPasswordReset(withEmail: email!) { error in
            SwiftSpinner.hide()
            
            if error != nil {
                self.lblStatus.text = "Reset failed"
            } else {
                self.lblStatus.text = "Reset link sent to your email"
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
