//
//  FavoriteItemCollectionViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class FavoriteItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavoriteItemCollectionViewCell"
    @IBOutlet var slotImage: UIImageView!
    @IBOutlet var slotNameLabel: UILabel!
    @IBOutlet var slotCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        slotImage.layer.cornerRadius = 5
    }
    
    func updateUI(data: [String] = []) {
    if !(data == []) {
        slotImage.kf.setImage(with: URL(string: data[0]))
        
        slotNameLabel.text = data[1]
        slotCountLabel.text = data[2]
        }
    }
}
