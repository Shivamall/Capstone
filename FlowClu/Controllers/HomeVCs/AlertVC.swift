//
//  AlertVC.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-07-03.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit

class AlertVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var whatYouNeed: UITextField!
    
   
    @IBOutlet weak var additionalComments: UITextField!
    
    
    
    
    @IBAction func checkEntries(_ sender: Any) {
        
//        ============= Sending to other view Controller (HelpListViewController) ============
        
        let detail:HelpListViewController = self.storyboard?.instantiateViewController(withIdentifier: "helpList") as! HelpListViewController
    
        self.navigationController?.pushViewController(detail, animated: true)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        whatYouNeed.delegate = self
        additionalComments.delegate = self
        
        
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
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
