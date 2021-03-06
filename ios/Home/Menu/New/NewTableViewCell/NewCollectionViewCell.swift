////
////  NewCollectionViewCell.swift
////  ios
////
////  Created by 이한길 on 2020/06/03.
////  Copyright © 2020 Jerry Jung. All rights reserved.
////
//
//import UIKit
//
//import UIKit
//import SnapKit
//
//class NewCollectionViewCell: UICollectionViewCell {
//    @IBOutlet var imageView: UIImageView!
//    @IBOutlet var saleLabel: UILabel!
//    @IBOutlet var priceLabel: UILabel!
//    @IBOutlet var marketLabel: UILabel!
//    @IBOutlet var productNameLabel: UILabel!
//    @IBOutlet var countLabel: UILabel!
//    @IBOutlet var hotDealLabel: UILabel!
//    @IBOutlet var saleConstraint: NSLayoutConstraint!
//    @IBOutlet var hotDealWidthConstraint: NSLayoutConstraint!
//    @IBOutlet var hotDealConstraint: NSLayoutConstraint!
//    @IBOutlet var favoriteButton: UIButton!
//
//    static let identifier: String = "NewCollectionViewCell"
//    var rootViewController: NewViewController!
//    var index: Int!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        hotDealLabel.layer.borderWidth = 1
//        hotDealLabel.layer.borderColor = UIColor.gray.cgColor
//    }
//
//    func updateUI(_ data: [NewBestResponseResult], index: Int, rootViewController: NewViewController) {
//        self.rootViewController = rootViewController
//
//        let isNotHotDeal = !(data[index].isHotDeal == "N")
//        let isNotSale = data[index].sale == "0%"
//        let isCount = data[index].count == nil
//        let isHeart = data[index].isMyHeart == "Y"
//
//        imageView.backgroundColor = .gray
//        imageView.kf.setImage(with: URL(string: data[index].imgageUrl))
//        imageView.layer.cornerRadius = 5
//        if isNotSale {
//            saleLabel.text = ""
//            saleConstraint.constant = 0
//        } else {
//            saleLabel.text = data[index].sale
//            saleConstraint.constant = 5
//        }
//
//        priceLabel.text = data[index].price
//        marketLabel.text = data[index].marketName
//        productNameLabel.text = data[index].productName
//
//        if isCount {
//            countLabel.text = "0개 구매중"
//        } else {
//            countLabel.text = data[index].count
//        }
//
//        if isNotHotDeal {
//            hotDealLabel.text = ""
//            hotDealWidthConstraint.constant = 0
//            hotDealConstraint.constant = 0
//        } else {
//            hotDealLabel.text = "핫딜"
//            hotDealWidthConstraint.constant = 32.5
//            hotDealConstraint.constant = 5
//        }
//
//        if isHeart {
//            favoriteButton.setImage(UIImage.favoritePink, for: .normal)
//        } else {
//            favoriteButton.setImage(UIImage.favoriteGray, for: .normal)
//        }
//
//        self.index = index
//
//    }
//    @IBAction func pressedFavorite(_ sender: Any) {
//        if rootViewController.recommendData[index].isMyHeart == "N" {
//            rootViewController.recommendData[index].isMyHeart = "Y"
//            favoriteButton.setImage(UIImage.favoritePink, for: .normal)
//        } else {
//            rootViewController.recommendData[index].isMyHeart = "N"
//            favoriteButton.setImage(UIImage.favoriteGray, for: .normal)
//        }
//    }
//}
//
