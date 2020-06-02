//
//  TodayViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class TodayViewController: BaseViewController {
    
    var recommendData: [RecommendedProductResponseResult]?
    var rootViewController: HomeViewController!
    var isScrolling: Bool = false
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let todayCellNib = UINib(nibName: TodayCollectionViewCell.identifier, bundle: nil)
        collectionView.register(todayCellNib, forCellWithReuseIdentifier: TodayCollectionViewCell.identifier)
        
//        TodayDataManager().getRecommendedProduct(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
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
        return recommendData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCollectionViewCell.identifier, for: indexPath) as? TodayCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateUI(recommendData!, index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ProductInfoDataManager().getProductInfo(index: indexPath.row + 1, todayViewController: self)
        
    }
    
}
