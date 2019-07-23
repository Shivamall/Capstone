//
//  PostDetailsVC.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-07-04.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit

class PostDetailsVC: UIViewController {
    
    
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDetailLabel: UILabel!
    
    var postTitle = ""
    var postDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTitleLabel.text = postTitle
        postDetailLabel.text = postDetail
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
