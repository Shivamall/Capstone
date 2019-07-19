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
        try! Auth.auth().signOut()
self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    
    }
}
