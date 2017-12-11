//
//  itemListTableViewCell.swift
//  Just Split It
//
//  Created by William on 12/11/17.
//

import UIKit

class itemListTableViewCell: UITableViewCell {

    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Detail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
