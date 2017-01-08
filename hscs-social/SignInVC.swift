//
//  SignInVC.swift
//  hscs-social
//
//  Created by Paul Hottell on 1/5/17.
//  Copyright © 2017 HSCS. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailAddress: CoolField!
    @IBOutlet weak var passwordField: CoolField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("HSCS: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("HSCS: User cancelled Facebook authentication")
            } else {
                print("HSCS: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("HSCS: Unable to authenticate with Firebase - \(error)")
            } else {
                print("HSCS: Successfully authenticated with Firebase")
//                if let user = user {
//                    let userData = ["provider": credential.provider]
//                    self.completeSignIn(id: user.uid, userData: userData)
//                }
            }
        })
    }
    
    @IBAction func emailSignInTapped(_ sender: Any) {
        if let email = emailAddress.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("HSCS: Email user authenticated with Firebase")
//                    if let user = user {
//                        let userData = ["provider": user.providerID]
//                        self.completeSignIn(id: user.uid, userData: userData)
//                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("HSCS: Unable to authenticate with Firebase using email")
                        } else {
                            print("HSCS: Successfully authenticated with Firebase")
//                            if let user = user {
//                                let userData = ["provider": user.providerID]
//                                self.completeSignIn(id: user.uid, userData: userData)
//                            }
                        }
                    })
                }
            })
        }
    }
}

