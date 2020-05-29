//
//  TodayCollectionViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class TodayCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var saleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var marketLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var hotDealLabel: UILabel!
    @IBOutlet var newLabel: UILabel!
    
    static let identifier: String = "TodayCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(_ data: [RecommendedProductResponseResult], index: Int) {
        imageView.kf.setImage(with: URL(string: data[index].imgageUrl))
        imageView.layer.cornerRadius = 10
        saleLabel.text = data[index].sale
        priceLabel.text = data[index].price
        marketLabel.text = data[index].marketName
        productNameLabel.text = data[index].productName
        countLabel.text = data[index].count
        hotDealLabel.isHidden = (data[index].isHotDeal == "N")
        newLabel.isHidden = (data[index].isNew == "N")
    }
}
