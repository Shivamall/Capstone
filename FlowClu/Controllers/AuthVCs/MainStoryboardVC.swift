//
//  ViewController.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-06-07.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn




class MainStoryboardVC: UIViewController, GIDSignInUIDelegate{
    
  var gradient : CAGradientLayer!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBAction func signOutButton(_ sender: Any) {
        
        GIDSignIn.sharedInstance()?.disconnect()
        print("=================discvonnected=====================")
        view.reloadInputViews()
    }
    
//    @IBOutlet weak var soignOutButton: UIButton!
    //    @IBOutlet weak var signOutButton: UIButton!

    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
      
    
        
    }
    
    
    @IBAction func signUpTap(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpScreen", sender: self)
    }
    
    @IBAction func loginTap(_ sender: Any) {
         self.performSegue(withIdentifier: "loginScreen", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // [START_EXCLUDE]
            print(user as Any , "is the user ")
            // [END_EXCLUDE]
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
        super.viewDidAppear(animated)
        
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "HomeScreen", sender: self)
        }
    }

}

