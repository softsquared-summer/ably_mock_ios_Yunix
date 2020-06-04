//
//  TodayViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Kingfisher

class TodayViewController: BaseViewController {
    
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var bannerScrollView: UIView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet var currentPageLabel: UILabel!
    @IBOutlet var totalPageLabel: UILabel!
    @IBOutlet var collectionViewHeight: NSLayoutConstraint!

    var isNavigationBar: Bool = true
    var isWaiting: Bool = false
    var recommendData: [RecommendedProductResponseResult] = []
    var rootViewController: HomeViewController!
    var isScrolling: Bool = false
    var scrollView: UIScrollView!
    @IBOutlet var collectionView: UICollectionView!
    var bannerData: [BannerResponseResult]!
    var index: Int!
    var currentPage: Int = 1
    var refreshControl = UIRefreshControl()

    @objc func refresh(_ sender: AnyObject) {
        currentPage = 1
        recommendData = []
        TodayDataManager().getRecommendedProduct(self, currentPage)
        refreshControl.endRefreshing()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainScrollView.delegate = self
        refreshControl.layer.zPosition = -1000
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        mainScrollView.addSubview(refreshControl) // not required when using UITableViewController
//        imagePageControl.layer.zPosition = contentView.layer.zPosition + 1
        
//        collectionView = UICollectionView(frame: contentView.bounds)
        
        let todayCellNib = UINib(nibName: TodayCollectionViewCell.identifier, bundle: nil)
        collectionView.register(todayCellNib, forCellWithReuseIdentifier: TodayCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        collectionView.isScrollEnabled = false
        
         contentView.addSubview(collectionView)
        
        BannerDataManager().getRecommendedProduct(self)
    }
    
    func receivedBanner(bannerData: [BannerResponseResult]!) {
        var i = 0
        index = bannerData.count
        
        scrollView = UIScrollView(frame: bannerScrollView.bounds)
        scrollView.delegate = self
        
        while i < index! {
            let subView = UIImageView()
            subView.kf.setImage(with: URL(string: bannerData[i].bannerUrl))
            subView.frame = bannerScrollView.bounds
            subView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(i)
            scrollView.addSubview(subView)
            i += 1
        }
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize.width = UIScreen.main.bounds.width * CGFloat(index!)
        scrollView.contentSize.height = bannerScrollView.frame.size.height
        scrollView.alwaysBounceHorizontal = false
        scrollView.bounces = false
        
        bannerScrollView.addSubview(scrollView)
        totalPageLabel.text = String(index!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func loadMoreCollectionView() {
        currentPage += 1
        TodayDataManager().getRecommendedProduct(self, currentPage)
    }
    
    func moveProductInfoViewController(data: ProductInfoResponseResult, index: Int) {
//        rootViewController.navigationController?.navigationBar.isTranslucent = true
//        rootViewController.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//       rootViewController.navigationController?.navigationBar.shadowImage = UIImage()
//        rootViewController.navigationController?.navigationBar.frame = .zero
//        rootViewController.navigationController?.navigationBar.barTintColor = .clear
        
        let nextViewController = ProductInfoViewController()
        nextViewController.productInfoData = data
        nextViewController.currentIndex = index
        rootViewController.navigationController?.pushViewController(nextViewController, animated: true)
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

extension TodayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCollectionViewCell.identifier, for: indexPath) as? TodayCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateUI(recommendData, index: indexPath.row, rootViewController: self)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ProductInfoDataManager().getProductInfo(index: recommendData[indexPath.row].index, todayViewController: self)
        
    }
    
}

extension TodayViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // floor 내림, ceil 올림
        // contentOffset는 현재 스크롤된 좌표
        if scrollView == self.scrollView {
            let page = floor(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            let intPage = Int(page)
            currentPageLabel.text = String(intPage + 1)
        }
        
        if scrollView == self.mainScrollView {
            rootViewController.navigationController?.setNavigationBarHidden((scrollView.contentOffset.y >= 10), animated: true)
                isNavigationBar = !(scrollView.contentOffset.y >= 10)

            
            if (scrollView.contentOffset.y + 1) >= (scrollView.contentSize.height - scrollView.frame.size.height) {
                //bottom reached
                collectionViewHeight.constant += 310 * 5
                currentPage += 1
                TodayDataManager().getRecommendedProduct(self, currentPage)
            }
        }
    }
}
