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
    var rootViewController: FavoriteItemViewController!
    var index: Int!
    var indexPath: IndexPath!
    
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
    
    func updateDrawersUI(data: DrawersResponseResult, indexPath: IndexPath) {
        self.index = data.drawerIdx
        self.indexPath = indexPath
        slotImage.kf.setImage(with: URL(string: data.thumbnailUrl[0]))
        slotNameLabel.text = data.drawerName
        slotCountLabel.text = data.productCnt
    }
    
    @IBAction func pressedSettingButton(_ sender: Any) {
        rootViewController.editDrawers(index: index, string: slotNameLabel.text!, indexPath: indexPath)
    }
}
