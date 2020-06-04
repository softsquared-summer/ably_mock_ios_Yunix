//
//  TapBarController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import CoreGraphics

var userToken = UserDefaults.standard.string(forKey: "USER_TOKEN")
var userName = UserDefaults.standard.string(forKey: "USER_NAME")
var isSet = true

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    var viewControllerList: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if userToken == "" {
            userToken = nil
        }
        
        if userName == "" {
            userName = nil
        }
        
        delegate = self
        
        viewControllerList.append(HomeViewController())
        viewControllerList.append(StyleViewController())
        viewControllerList.append(MarketViewController())
        viewControllerList.append(FavoriteViewController())
        viewControllerList.append(MyPageViewController())
        
        if !(userToken == nil) {
            AutoLoginDataManager().getAutoLogin(self, userToken, userName)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isSet {
            let ratio: CGFloat = 0.4
            
            let item1 = viewControllerList[0]
            let icon1 = UITabBarItem(title: "홈", image: UIImage.homeGray?.resize(ratio: ratio), selectedImage: UIImage.homePink?.resize(ratio: ratio))
            icon1.titlePositionAdjustment.vertical = -5
            item1.tabBarItem = icon1
            
            let item2 = viewControllerList[1]
            let icon2 = UITabBarItem(title: "스타일", image: UIImage.styleGray?.resize(ratio: ratio), selectedImage: UIImage.stylePink?.resize(ratio: ratio))
            icon2.titlePositionAdjustment.vertical = -5
            item2.tabBarItem = icon2
            
            let item3 = viewControllerList[2]
            let icon3 = UITabBarItem(title: "마켓", image: UIImage.marketGray?.resize(ratio: ratio), selectedImage: UIImage.marketPink?.resize(ratio: ratio))
            icon3.titlePositionAdjustment.vertical = -5
            item3.tabBarItem = icon3
            
            let item4 = viewControllerList[3]
            let icon4 = UITabBarItem(title: "찜", image: UIImage.favoriteGray?.resize(ratio: ratio), selectedImage: UIImage.favoritePink?.resize(ratio: ratio))
            icon4.titlePositionAdjustment.vertical = -5
            item4.tabBarItem = icon4
            
            let item5 = viewControllerList[4]
            let icon5 = UITabBarItem(title: "마이페이지", image: UIImage.myPageGray?.resize(ratio: ratio), selectedImage: UIImage.myPagePink?.resize(ratio: ratio))
            icon5.titlePositionAdjustment.vertical = -5
            item5.tabBarItem = icon5
            
            let controllers = [item1, item2, item3, item4, item5]  //array of the root view controllers displayed by the tab bar interface
            
            self.viewControllers = controllers
            
            self.tabBar.barTintColor = UIColor(hex: 0xFFFFFF, alpha: 1)
            self.tabBar.tintColor = UIColor(hex: 0xFE5160, alpha: 1)
            
            navigationController?.navigationBar.barTintColor = UIColor(hex: 0xFFFFFF, alpha: 1)
            navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
            
            let ratio2: CGFloat = 0.4
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem?.tintColor = UIColor(hex: 0xFFFFFF, alpha: 1)
            
            let shoppingCarButton = UIBarButtonItem(image: UIImage.shoppingCar?.resize(ratio: ratio2).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
                       self.navigationItem.rightBarButtonItems = [shoppingCarButton]
            self.navigationController?.navigationBar.topItem?.title = nil
            
            let searchBar = UISearchBar()
            
            searchBar.placeholder = "상품이나 마켓을 검색해보세요!"
            searchBar.setValue("취소", forKey: "cancelButtonText")
            searchBar.backgroundColor = UIColor(hex: 0xFFFFFF, alpha: 1)
            let textField = searchBar.value(forKey: "_searchField") as? UITextField
            textField?.backgroundColor = UIColor(hex: 0xEEEEEE, alpha: 1)
            textField?.textColor = UIColor(hex: 0x666666, alpha: 1)
            let font: UIFont = .boldSystemFont(ofSize: 14)
            textField?.font = font
            
            navigationController?.navigationBar.topItem?.titleView = searchBar
            
            isSet = !isSet
        }
    }

    
    //Delegate methods
    
 func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem?.tintColor = .black
    navigationController?.navigationBar.barTintColor = UIColor(hex: 0xFFFFFF, alpha: 1)
    navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    navigationController?.navigationBar.isHidden = false
    
        let ratio: CGFloat = 0.4
        
        if viewController == viewControllerList[0] {
            
             let shoppingCarButton = UIBarButtonItem(image: UIImage.shoppingCar?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
                       self.navigationItem.rightBarButtonItems = [shoppingCarButton]
            self.navigationController?.navigationBar.topItem?.title = nil
            
            let searchBar = UISearchBar()
            
            searchBar.placeholder = "상품이나 마켓을 검색해보세요!"
            searchBar.setValue("취소", forKey: "cancelButtonText")
            searchBar.backgroundColor = UIColor(hex: 0xFFFFFF, alpha: 1)
            let textField = searchBar.value(forKey: "_searchField") as? UITextField
            textField?.backgroundColor = UIColor(hex: 0xEEEEEE, alpha: 1)
            textField?.textColor = UIColor(hex: 0x666666, alpha: 1)
            let font: UIFont = .boldSystemFont(ofSize: 14)
            textField?.font = font
            
            navigationController?.navigationBar.topItem?.titleView = searchBar
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem?.tintColor = UIColor(hex: 0xFFFFFF, alpha: 1)
            
            
            
        } else if viewController == viewControllerList[1] {
             
             let searchButton = UIBarButtonItem(image: UIImage.search?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            let shoppingCarButton = UIBarButtonItem(image: UIImage.shoppingCar?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            self.navigationItem.rightBarButtonItems = [shoppingCarButton, searchButton]
             
             self.navigationController?.navigationBar.topItem?.titleView = nil
            self.navigationController?.navigationBar.topItem?.title = "스타일"
        } else if viewController == viewControllerList[2] {
             
             let searchButton = UIBarButtonItem(image: UIImage.search?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            let shoppingCarButton = UIBarButtonItem(image: UIImage.shoppingCar?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            self.navigationItem.rightBarButtonItems = [shoppingCarButton, searchButton]
             
             self.navigationController?.navigationBar.topItem?.titleView = nil
            self.navigationController?.navigationBar.topItem?.title = "6월 1주차 랭킹"
        } else if viewController == viewControllerList[3] {
             
             let searchButton = UIBarButtonItem(image: UIImage.search?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            let shoppingCarButton = UIBarButtonItem(image: UIImage.shoppingCar?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            self.navigationItem.rightBarButtonItems = [shoppingCarButton, searchButton]

             self.navigationController?.navigationBar.topItem?.titleView = nil
            
            self.navigationController?.navigationBar.topItem?.title = "찜"
        } else if viewController == viewControllerList[4] {
             let searchButton = UIBarButtonItem(image: UIImage.search?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            let shoppingCarButton = UIBarButtonItem(image: UIImage.shoppingCar?.resize(ratio: ratio).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            self.navigationItem.rightBarButtonItems = [shoppingCarButton, searchButton]

             self.navigationController?.navigationBar.topItem?.titleView = nil
            
            self.navigationController?.navigationBar.topItem?.title = "마이페이지"
        } else {
            print("뷰 컨트롤러 설정을 실패했습니다.")
    }
        return true;
    }
}
    
