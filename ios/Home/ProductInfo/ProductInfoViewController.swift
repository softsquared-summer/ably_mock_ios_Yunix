//
//  ProductInfoViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Kingfisher

class ProductInfoViewController: UIViewController {

    @IBOutlet var imageScrolleView: UIScrollView!
    @IBOutlet var imagePageControl: UIPageControl!
    
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    @IBOutlet var displayPrice: UILabel!
    @IBOutlet var originalPrice: UILabel!
    
    @IBOutlet var marketImage: UIImageView!
    @IBOutlet var marketName: UILabel!
    @IBOutlet var marketHashTag: UILabel!
    
    var productInfoData: ProductInfoResponseResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = nil
        
        let index = productInfoData?.normalImgUrlList.count
        var i = 0
        
        while i < index! {
            let subView = UIImageView()
            subView.kf.setImage(with: URL(string: (productInfoData?.normalImgUrlList[i])!))
            subView.frame = UIScreen.main.bounds
            subView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(i)
            imageScrolleView.addSubview(subView)
            i += 1
        }
        
        imageScrolleView.isPagingEnabled = true
        
        imageScrolleView.contentSize.width = UIScreen.main.bounds.width * CGFloat(index!)
        
        imageScrolleView.alwaysBounceVertical = false
        
        imagePageControl.numberOfPages = index!
        
        imagePageControl.layer.zPosition = imageScrolleView.layer.zPosition + 1
        
        productNameLabel.text = productInfoData?.productName
        discountLabel.text = productInfoData?.discountRatio
        displayPrice.text = productInfoData?.displayedPrice
        originalPrice.text = productInfoData?.price
        
        marketImage.kf.setImage(with: URL(string: (productInfoData?.marketThumbnailUrl)!))
        marketImage.contentMode = .scaleToFill
        marketImage.layer.cornerRadius = 20
        marketName.text = productInfoData?.marketName
        marketHashTag.text = productInfoData?.marketHashTags
    }
    
    func recieveInfo(_ index: Int, _ todayViewController: TodayViewController) {
        ProductInfoDataManager().getProductInfo(index: index, todayViewController: todayViewController)
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
        imagePageControl.currentPage = Int(floor(imageScrolleView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
