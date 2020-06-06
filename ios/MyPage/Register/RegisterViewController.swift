//
//  RegisterViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        
    }

    @IBAction func pressedRegisterWithEmail(_ sender: Any) {
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(InputUserInfoViewController(), animated: true)
    }
    
    @IBAction func pressedLoginWithEmail(_ sender: Any) {
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @IBAction func pressedCancel(_ sender: Any) {
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
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
