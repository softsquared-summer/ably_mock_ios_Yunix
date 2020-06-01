//
//  HomeViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class HomeViewController: BaseViewController {
    
    @IBOutlet var menuView: SwipeMenuView!

    let searchController = UISearchController(searchResultsController: nil)
    
    let searchBar = UISearchBar()
    
    var todayViewController: TodayViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todayViewController = TodayViewController()
        
       menuView.dataSource = self
       menuView.delegate = self

       var options = menuView.options

       options.tabView.height = 40

       options.tabView.margin = 10

       options.tabView.itemView.margin = 25

       options.tabView.itemView.font = UIFont.boldSystemFont(ofSize: 16)

       options.tabView.additionView.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

       options.tabView.additionView.underline.height = 3

        options.tabView.style = .flexible

       menuView.reloadData(options: options)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.topItem?.rightBarButtonItems = nil
        
        self.navigationController?.navigationBar.topItem?.title = nil
        
        searchBar.placeholder = "상품이나 마켓을 검색해보세요!"
        searchBar.setValue("취소", forKey: "cancelButtonText")
        searchBar.backgroundColor = UIColor(hex: 0xFFFFFF, alpha: 1)
        searchBar.barTintColor = UIColor(hex: 0xFF0000, alpha: 1)
        searchBar.showsCancelButton = true
        
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
//        self.navigationController?.navigationBar.topItem?.searchController = searchController
//
//        searchController.hidesNavigationBarDuringPresentation = false
//
//        searchController.searchResultsUpdater = self
//
//        searchController.obscuresBackgroundDuringPresentation = false
//
//        searchController.searchBar.placeholder = "상품이나 마켓을 검색해보세요!"
//
//        definesPresentationContext = true
//
//        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
//
//        searchController.searchBar.tintColor = UIColor(hex: 0x777777, alpha: 1)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.titleView = nil
        
        let searchButton = UIBarButtonItem(image: UIImage.search?.resize(ratio: 0.4).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        let shoppingCarButton = UIBarButtonItem(image: UIImage.shoppingCar?.resize(ratio: 0.4).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItems = [shoppingCarButton, searchButton]
        
//        navigationController?.navigationBar.isHidden = false
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

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //
    }
    
    
}

extension HomeViewController: SwipeMenuViewDelegate, SwipeMenuViewDataSource {

    //MARK - SwipeMenuViewDataSource
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return 4
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        switch index {
        case 0:
            return "투데이"
        case 1:
            return "NEW"
        case 2:
            return "BEST"
        case 3:
            return "핫딜"
        default:
            return "기본값"
        }
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        switch index {
        case 0:
            return todayViewController
        case 1:
            return NewViewController()
        case 2:
            return BestViewController()
        case 3:
            return HotDealViewController()
        default:
            return TodayViewController()
        }
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        if currentIndex == 0 {
            todayViewController.rootViewController = self
            TodayDataManager().getRecommendedProduct(todayViewController)
        }
    }
}

