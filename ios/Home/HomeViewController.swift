//
//  HomeViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = nil
        
        self.navigationController?.navigationBar.topItem?.searchController = searchController
        
        self.navigationController?.navigationItem.titleView = searchController.searchBar
        
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchResultsUpdater = self
               
        searchController.obscuresBackgroundDuringPresentation = false
       
        searchController.searchBar.placeholder = "상품이나 마켓을 검색해보세요!"
       
        definesPresentationContext = true
       
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.searchController = nil
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
