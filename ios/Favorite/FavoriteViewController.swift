//
//  FavoriteViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class FavoriteViewController: BaseViewController {
    @IBOutlet var menuView: SwipeMenuView!
    
    var refreshControl = UIRefreshControl()

    @objc func refresh(_ sender: AnyObject) {
        refreshControl.endRefreshing()
    }
    
    var favoriteItemViewController: FavoriteItemViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteItemViewController = FavoriteItemViewController()
        // Do any additional setup after loading the view.
        refreshControl.layer.zPosition = -1000
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        menuView.dataSource = self
        menuView.delegate = self
        
        var options = menuView.options
        
        options.tabView.height = 40
        
        options.tabView.margin = 10
        
        options.tabView.itemView.margin = 10
        
        options.tabView.itemView.font = UIFont.boldSystemFont(ofSize: 16)
        
        options.tabView.additionView.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        options.tabView.additionView.underline.height = 3
        
        menuView.reloadData(options: options)
    }

    override func viewWillAppear(_ animated: Bool) {
        
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

extension FavoriteViewController: SwipeMenuViewDelegate, SwipeMenuViewDataSource {
    
    //MARK - SwipeMenuViewDataSource
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return 2
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        if index == 0 {
            return "상품"
        } else {
            return "마켓"
        }
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        if index == 0 {
            return favoriteItemViewController
        } else {
            return FavoriteMarketViewController()
        }
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
           if currentIndex == 0 {
               favoriteItemViewController.rootViewController = self
           }
       }
}

