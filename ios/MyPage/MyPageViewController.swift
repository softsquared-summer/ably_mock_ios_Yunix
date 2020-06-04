//
//  MyPageViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import PMSuperButton

class MyPageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        if userToken == nil {
            let nextViewController = BeforeLoginViewController()
            nextViewController.view.frame = view.bounds
            addChild(nextViewController)
            view.addSubview(nextViewController.view)
        } else {
            let nextViewController = AfterLoginViewController()
            nextViewController.view.frame = view.bounds
            addChild(nextViewController)
            view.addSubview(nextViewController.view)
        }
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
