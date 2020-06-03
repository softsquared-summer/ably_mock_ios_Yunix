//
//  NewViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class NewViewController: BaseViewController {
    
    var isWaiting: Bool = false
    var recommendData: [NewBestResponseResult] = []
    var rootViewController: HomeViewController!
    var isScrolling: Bool = false
    var index: Int!
    var currentPage: Int = 1
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
