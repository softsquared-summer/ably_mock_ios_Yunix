//
//  ProductInfoViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class ProductInfoViewController: UIViewController {

    @IBOutlet var imagePageControl: UIPageControl!
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    @IBOutlet var displayPrice: UILabel!
    @IBOutlet var originalPrice: UILabel!
    
    @IBOutlet var marketImage: UIImageView!
    @IBOutlet var marketName: UILabel!
    @IBOutlet var marketHashTag: UILabel!
    @IBOutlet var couponLabel: UILabel!
    
    @IBOutlet var saleConstraint: NSLayoutConstraint!
    @IBOutlet var saleLine: UIView!
    
    var index: Int!
    var productInfoData: ProductInfoResponseResult?
    var currentIndex: Int!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = nil
        
        self.index = productInfoData?.normalImgUrlList.count
        var i = 0
        
        scrollView = UIScrollView(frame: contentView.bounds)
        scrollView.delegate = self
        
        while i < index! {
            let subView = UIImageView()
            subView.kf.setImage(with: URL(string: (productInfoData?.normalImgUrlList[i])!))
            subView.frame = contentView.bounds
            subView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(i)
            scrollView.addSubview(subView)
            i += 1
        }
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize.width = UIScreen.main.bounds.width * CGFloat(index!)
        scrollView.contentSize.height = contentView.frame.size.height
        scrollView.alwaysBounceHorizontal = false
        scrollView.bounces = false
        
        imagePageControl.numberOfPages = index!
        imagePageControl.layer.zPosition = contentView.layer.zPosition + 1
        
        productNameLabel.text = productInfoData?.productName
        
        if productInfoData?.discountRatio == "0%" {
            discountLabel.text = ""
            couponLabel.text = "2000원"
            saleConstraint.constant = 0
            originalPrice.text = ""
            saleLine.isHidden = true
        } else {
            couponLabel.text = productInfoData?.discountRatio
            discountLabel.text = productInfoData?.discountRatio
            saleConstraint.constant = 10
            originalPrice.text = productInfoData?.price
            saleLine.isHidden = false
        }
        
        displayPrice.text = productInfoData?.displayedPrice
        
        marketImage.kf.setImage(with: URL(string: (productInfoData?.marketThumbnailUrl)!))
        marketImage.contentMode = .scaleToFill
        marketImage.layer.cornerRadius = 20
        marketName.text = productInfoData?.marketName
        marketHashTag.text = productInfoData?.marketHashTags
        
        contentView.addSubview(scrollView)

        scrollView.snp.makeConstraints({ (make) in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        })
    }
    
    func recieveInfo(_ index: Int, _ todayViewController: TodayViewController) {
        ProductInfoDataManager().getProductInfo(index: index, todayViewController: todayViewController)
    }

    @IBAction func pressedPurchase(_ sender: Any) {
        let productOptionStoryboard = UIStoryboard(name: "ProductOption", bundle: Bundle.main)
        guard let productOption = productOptionStoryboard
            .instantiateViewController(withIdentifier: "ProductOption") as? ProductOptionViewController else {
            return
        }
        productOption.modalPresentationStyle = .custom
        productOption.modalTransitionStyle = .crossDissolve
        productOption.currentIndex = currentIndex
        self.present(productOption, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProductInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // floor 내림, ceil 올림
        // contentOffset는 현재 스크롤된 좌표
        imagePageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
