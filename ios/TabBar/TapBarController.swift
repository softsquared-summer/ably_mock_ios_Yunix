//
//  TapBarController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import CoreGraphics

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let ratio: CGFloat = 0.4
        
        let item1 = TodayViewController()
        let icon1 = UITabBarItem(title: "홈", image: UIImage.homeGray?.resize(ratio: ratio), selectedImage: UIImage.homePink?.resize(ratio: ratio))
        icon1.titlePositionAdjustment.vertical = -5
        item1.tabBarItem = icon1
        
        let item2 = StyleViewController()
        let icon2 = UITabBarItem(title: "스타일", image: UIImage.styleGray?.resize(ratio: ratio), selectedImage: UIImage.stylePink?.resize(ratio: ratio))
        icon2.titlePositionAdjustment.vertical = -5
        item2.tabBarItem = icon2
        
        let item3 = MarketViewController()
        let icon3 = UITabBarItem(title: "마켓", image: UIImage.marketGray?.resize(ratio: ratio), selectedImage: UIImage.marketPink?.resize(ratio: ratio))
        icon3.titlePositionAdjustment.vertical = -5
        item3.tabBarItem = icon3
        
        let item4 = FavoriteViewController()
        let icon4 = UITabBarItem(title: "찜", image: UIImage.favoriteGray?.resize(ratio: ratio), selectedImage: UIImage.favoritePink?.resize(ratio: ratio))
        icon4.titlePositionAdjustment.vertical = -5
        item4.tabBarItem = icon4
        
        let item5 = MyPageViewController()
        let icon5 = UITabBarItem(title: "마이페이지", image: UIImage.myPageGray?.resize(ratio: ratio), selectedImage: UIImage.myPagePink?.resize(ratio: ratio))
        icon5.titlePositionAdjustment.vertical = -5
        item5.tabBarItem = icon5
        
        let controllers = [item1, item2, item3, item4, item5]  //array of the root view controllers displayed by the tab bar interface
        
        self.tabBar.barTintColor = UIColor(hex: 0xFFFFFF, alpha: 1)
        self.tabBar.tintColor = UIColor(hex: 0xFE5160, alpha: 1)
        
        self.viewControllers = controllers
        
        navigationController?.navigationBar.barTintColor = UIColor(hex: 0xFFFFFF, alpha: 1)
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        let ratio2: CGFloat = 0.4
        
        let searchButton = UIBarButtonItem(image: UIImage.search?.resize(ratio: ratio2).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        let shoppingCarButton = UIBarButtonItem(image: UIImage.shoppingCar?.resize(ratio: ratio2).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItems = [shoppingCarButton, searchButton]
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController)")
        return true;
    }
}
    
