//
//  StyleTableViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class StyleTableViewCell: UITableViewCell {

    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var newLabel: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    static let identifier = "StyleTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newLabel.layer.borderWidth = 1
        newLabel.layer.cornerRadius = 7.5
        newLabel.layer.borderColor = UIColor(hex: 0xFE5160, alpha: 0.5).cgColor
        
        cellImage.kf.setImage(with: URL(string: imageList.randomElement()!))
        cellImage.contentMode = .scaleAspectFill
        cellImage.layer.zPosition = -1000
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(data: [String] = []) {
        if !(data == []) {
            cellImage.kf.setImage(with: URL(string: data[0]))
            name.text = data[1]
            contentLabel.text = data[2]
        }
    }
}
