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
    
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var imageTopConst: NSLayoutConstraint!
    
    var currentAlpha: CGFloat = 0
    var index: Int!
    var productInfoData: ProductInfoResponseResult?
    var currentIndex: Int!
    var scrollView: UIScrollView!
    var isHeart = false
    
    @IBOutlet var heartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.snp.makeConstraints({ (make) in
//            make.top.equalTo(self.view.superview?.snp.top as! ConstraintRelatableTarget)
//        })
        self.navigationItem.title = "상품 정보"
        
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        
        self.index = productInfoData?.normalImgUrlList.count
        var i = 0
        
        scrollView = UIScrollView(frame: contentView.bounds)
        scrollView.delegate = self
        mainScrollView.delegate = self
        
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
            couponLabel.text = "2,000원"
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 160.0)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black.withAlphaComponent(currentAlpha)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black.withAlphaComponent(1)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func recieveInfo(_ index: Int, _ todayViewController: TodayViewController) {
        ProductInfoDataManager().getProductInfo(index: index, todayViewController: todayViewController)
    }

    @IBAction func pressedPurchase(_ sender: Any) {
        if !(userToken == nil) {
            let productOptionStoryboard = UIStoryboard(name: "ProductOption", bundle: Bundle.main)
            guard let productOption = productOptionStoryboard
                .instantiateViewController(withIdentifier: "ProductOption") as? ProductOptionViewController else {
                return
            }
            productOption.rootViewController = self
            productOption.modalPresentationStyle = .custom
            productOption.modalTransitionStyle = .crossDissolve
            productOption.currentIndex = currentIndex
            self.present(productOption, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "로그인이 필요한 기능입니다.", message: nil, preferredStyle: .alert)
            let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(actionOkay)

            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func pressedHeart(_ sender: Any) {
        isHeart = !isHeart
        
        if isHeart {
            heartButton.setImage(UIImage.myHeartf, for: .normal)
        } else {
            heartButton.setImage(UIImage.myHearte, for: .normal)
        }
        
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
        if scrollView == self.scrollView {
            imagePageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
        } else if scrollView == self.mainScrollView {
            let height = scrollView.contentOffset.y
            var alpha: CGFloat = 1
            
            if height <= 0 {
                alpha = (64/350) * ( 1 - (-height / 64) )
            } else if height > 0 {
                alpha = (284/350) * (height / 284) + (64/350)
            }
            
            if height < -64 {
                self.imageTopConst.constant = height + 64
            } else {
                self.imageTopConst.constant = 0
            }
            
            navigationController?.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(alpha)
            
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black.withAlphaComponent(alpha)]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
            
            currentAlpha = alpha
        }
        
    }
}
