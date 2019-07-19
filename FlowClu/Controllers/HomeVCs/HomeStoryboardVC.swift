//
//  HomeStoryboardVC.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-06-12.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit

class HomeStoryboardVC: UIViewController {

    @IBOutlet weak var settingsButtonClicked: UIButton!
    @IBOutlet weak var nextPeriodDetailsHeaderLabel: UILabel!
    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var randomPostLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
   
    
    
    @IBAction func addPeriodButtonClicked(_ sender: Any) {
    }
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
