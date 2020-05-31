//
//  FirstOptionTableViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class FirstOptionTableViewCell: UITableViewCell {

    @IBOutlet var optionLabel: UILabel!
    
    static let identifier: String = "FirstOptionTableViewCell"
    
    var tableView: SelectedFirstOptionViewController!
    var index: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
//        
    }
    
    
    func updateUI(_ option: String!, _ index: Int!) {
        optionLabel.text = option
        self.index = index
    }
}
