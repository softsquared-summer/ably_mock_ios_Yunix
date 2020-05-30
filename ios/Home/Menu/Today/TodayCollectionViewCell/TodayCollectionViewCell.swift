//
//  TodayCollectionViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import SnapKit

class TodayCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var saleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var marketLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var hotDealLabel: UILabel!
    
    static let identifier: String = "TodayCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hotDealLabel.layer.borderWidth = 1
        print("1")
    }
    
    func updateUI(_ data: [RecommendedProductResponseResult], index: Int) {
        let isHotDeal = data[index].isHotDeal == "N"
        let isNotSale = data[index].sale == "0%"
        let isCount = data[index].count == nil
        
        imageView.backgroundColor = .gray
        imageView.kf.setImage(with: URL(string: data[index].imgageUrl))
        imageView.layer.cornerRadius = 5
        saleLabel.isHidden = isNotSale
        saleLabel.text = data[index].sale
        priceLabel.text = data[index].price
        marketLabel.text = data[index].marketName
        productNameLabel.text = data[index].productName
        
        if isCount {
            countLabel.text = "0개 구매중"
        } else {
            countLabel.text = data[index].count
        }
        
        
        hotDealLabel.isHidden = isHotDeal
        
//        if isHotDeal {
//            hotDealLabel.snp.makeConstraints { (make) in
//                make.width.equalTo(0)
//            }
//        } else {
//            hotDealLabel.snp.makeConstraints { (make) in
//                make.width.equalTo(42.5)
//            }
//        }

    }
}
