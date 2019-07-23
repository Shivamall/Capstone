//
//  Extensions.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-06-17.
//  Copyright © 2019 Harman Gill. All rights reserved.
//
import MapKit
import UIKit





extension UIViewController {
    
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}




