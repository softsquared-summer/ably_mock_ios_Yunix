//
//  TodayCollectionViewCell.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class TodayCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var saleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var marketLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var hotDealLabel: UILabel!
    @IBOutlet var saleConstraint: NSLayoutConstraint!
    @IBOutlet var hotDealWidthConstraint: NSLayoutConstraint!
    @IBOutlet var hotDealConstraint: NSLayoutConstraint!
    @IBOutlet var favoriteButton: UIButton!
    
    @IBOutlet var heartTrailing: NSLayoutConstraint!
    @IBOutlet var heartTop: NSLayoutConstraint!
    @IBOutlet var heartHeigth: NSLayoutConstraint!
    
    var data: [RecommendedProductResponseResult]!
    static let identifier: String = "TodayCollectionViewCell"
    var rootViewController: TodayViewController!
    var index: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hotDealLabel.layer.borderWidth = 1
        hotDealLabel.layer.borderColor = UIColor(hex: 0xFE5160, alpha: 1).cgColor
        
       
        
    }
    
    func updateUI(_ data: [RecommendedProductResponseResult], index: Int, rootViewController: TodayViewController) {
        self.rootViewController = rootViewController
        self.data = data
        let isNotHotDeal = !(data[index].isHotDeal == "N")
        let isNotSale = data[index].sale == "0%"
        let isCount = data[index].count == nil
        let isHeart = data[index].isMyHeart == "Y"
        
        imageView.backgroundColor = .gray
        imageView.kf.setImage(with: URL(string: data[index].imgageUrl))
        imageView.layer.cornerRadius = 5
        if isNotSale {
            saleLabel.text = ""
            saleConstraint.constant = 0
        } else {
            saleLabel.text = data[index].sale
            saleConstraint.constant = 5
        }
        
        priceLabel.text = data[index].price
        marketLabel.text = data[index].marketName
        productNameLabel.text = data[index].productName
        
        if isCount {
            countLabel.text = "0개 구매중"
        } else {
            countLabel.text = data[index].count
        }
        
        if isNotHotDeal {
            hotDealLabel.text = ""
            hotDealWidthConstraint.constant = 0
            hotDealConstraint.constant = 0
        } else {
            hotDealLabel.text = "핫딜"
            hotDealWidthConstraint.constant = 32.5
            hotDealConstraint.constant = 5
        }
        
        if isHeart {
            favoriteButton.setImage(UIImage.favoritePink!.resize(ratio: 0.5), for: .normal)
            heartHeigth.constant = 20
            heartTop.constant = 12.5
            heartTrailing.constant = 12.5
        } else {
            favoriteButton.setImage(UIImage.myHeartw, for: .normal)
            heartHeigth.constant = 25
            heartTop.constant = 10
            heartTrailing.constant = 10
        }
        
        self.index = index
        
    }
    
    @IBAction func pressedFavorite(_ sender: Any) {
        if !(userToken == nil) {
            MyHeartDataManager().postMyHeart(self, data[self.index].index)
        } else {
            let alert = UIAlertController(title: "로그인이 필요한 기능입니다.", message: nil, preferredStyle: .alert)
            let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(actionOkay)

            rootViewController.present(alert, animated: true, completion: nil)
        }
    
    }
    
    func successHeart() {
        if rootViewController.recommendData[index].isMyHeart == "N" {
            rootViewController.recommendData[index].isMyHeart = "Y"
            favoriteButton.setImage(UIImage.favoritePink!.resize(ratio: 0.5), for: .normal)
            heartHeigth.constant = 20
            heartTop.constant = 12.5
            heartTrailing.constant = 12.5
        } else {
            rootViewController.recommendData[index].isMyHeart = "N"
            favoriteButton.setImage(UIImage.myHeartw, for: .normal)
            heartHeigth.constant = 25
            heartTop.constant = 10
            heartTrailing.constant = 10
        }
    }
}
