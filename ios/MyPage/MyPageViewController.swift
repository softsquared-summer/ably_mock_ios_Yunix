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
    }

    @IBAction func pressedLogin(_ sender: PMSuperButton) {
        
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @IBAction func pressedRegister(_ sender: PMSuperButton) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
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
