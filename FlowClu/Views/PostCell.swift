//
//  PostCell.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-07-04.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post) {
        postTitleLabel.text = post.title
        postDetailsLabel.text = post.detail
    }

}
