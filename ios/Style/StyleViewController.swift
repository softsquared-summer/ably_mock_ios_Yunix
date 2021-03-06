//
//  StyleViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class StyleViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var data: [[String]]?
    var refreshControl = UIRefreshControl()

       @objc func refresh(_ sender: AnyObject) {
           refreshControl.endRefreshing()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.layer.zPosition = -1000
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        let styleTableViewCell = UINib(nibName: StyleTableViewCell.identifier, bundle: nil)
        tableView.register(styleTableViewCell, forCellReuseIdentifier: StyleTableViewCell.identifier)
        
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
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

extension StyleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StyleTableViewCell.identifier, for: indexPath) as? StyleTableViewCell else {
                    return UITableViewCell()
        }

        cell.updateUI()
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 335
    }
}
