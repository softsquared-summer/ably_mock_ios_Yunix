//
//  SecondOptionTableViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SecondOptionTableViewCell: UITableViewCell {
    @IBOutlet var secondOptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    static let identifier: String = "SecondOptionTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(secondOption: String!, price: Int!) {
        secondOptionLabel.text = secondOption
        priceLabel.text = String(price).insertComma + "원"
    }
}
