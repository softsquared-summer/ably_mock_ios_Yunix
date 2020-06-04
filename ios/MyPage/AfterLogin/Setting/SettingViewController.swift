//
//  SettingViewController.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "설정"
        // Do any additional setup after loading the view.
        
    }

    @IBAction func pressedLogout(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "USER_TOKEN")
        UserDefaults.standard.set(nil, forKey: "USER_NAME")
        userName = nil
        userToken = nil
        navigationController?.popViewController(animated: true)
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
