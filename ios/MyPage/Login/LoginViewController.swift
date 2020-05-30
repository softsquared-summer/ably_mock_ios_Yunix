//
//  LoginViewController.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "이메일로 로그인하기"
        navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor(hex: 0x777777, alpha: 1)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = nil
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    @IBAction func pressedLogin(_ sender: Any) {
        let header: HTTPHeaders = ["userType" : "NORMAL",
                                   "email" : emailTextfield.text!,
                                   "password" : passwordTextfield.text!]
        LoginDataManager().postLogin(self, header)
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
