//
//  ItemTableViewCell.swift
//  Just Split It
//
//  Created by Maria-Belem on 12/11/17.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    var cellButton: UIButton!
    var cellLabel: UILabel!
    
    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cellLabel = UILabel(frame: CGRect(self.frame.width - 100, 10, 100.0, 40))
        cellLabel.textColor = UIColor.black
        cellLabel.font = //set font here
            
        cellButton = UIButton(frame: CGRect(5, 5, 50, 30))
        cellButton.setTitle(title, for: UIControlState.Normal)
        
        addSubview(cellLabel)
        addSubview(cellButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
