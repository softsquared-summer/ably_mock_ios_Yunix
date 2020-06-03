//
//  MarketViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {

    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    
    var refreshControl = UIRefreshControl()

    @objc func refresh(_ sender: AnyObject) {
        refreshControl.endRefreshing()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let marketTableViewCell = UINib(nibName: MarketTableViewCell.identifier, bundle: nil)
        tableView.register(marketTableViewCell, forCellReuseIdentifier: MarketTableViewCell.identifier)
        
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.isScrollEnabled = false
        
        tableViewHeight.constant = 1750
        
        refreshControl.layer.zPosition = -1000
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
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

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as? MarketTableViewCell else {
                    return UITableViewCell()
        }

        cell.updateUI(index: indexPath.row + 1)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}
