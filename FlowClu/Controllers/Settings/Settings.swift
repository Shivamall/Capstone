//
//  Settings.swift
//  FlowClu
//
//  Created by laptop on 2019-07-18.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class Settings: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func logoutTap(_ sender: Any) {
        print("I am working 11111111=======================================check anagin")

        try! Auth.auth().signOut()
        print("I am working=======================================check anagin")
        UserDefaults.standard.removeObject(forKey: "myID")
        
        let MainScreenStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let initialNavigationController = MainScreenStoryboard.instantiateInitialViewController() as! UINavigationController
        self.present(initialNavigationController, animated: true, completion: nil)
        
//        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    
    }
}
