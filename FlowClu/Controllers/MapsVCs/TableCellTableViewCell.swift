//
//  TableCellTableViewCell.swift
//  FlowClu
//
//  Created by Ashish Ashish on 2019-07-05.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var longLabel: UILabel!
    
    @IBOutlet weak var latLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
