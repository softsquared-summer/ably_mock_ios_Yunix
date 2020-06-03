//
//  FavoriteItemInfoCollectionViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class FavoriteItemInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var saleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var saleConstraint: NSLayoutConstraint!
    
    static let identifier = "FavoriteItemInfoCollectionViewCell"
    
    var data: [RecommendedProductResponseResult]!
    var rootViewController: TodayViewController!
    var index: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView.layer.cornerRadius = 5
    }

}
