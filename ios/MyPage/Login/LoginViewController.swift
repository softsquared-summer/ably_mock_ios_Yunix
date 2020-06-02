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
       let parameters: Parameters = Parameters(dictionaryLiteral: ("userType", "NORMAL"),
        ("email", emailTextfield.text!),
        ("password", passwordTextfield.text!))
        LoginDataManager().postLogin(self, parameters)
    }
    
    func loginSuccess() {
        let alert = UIAlertController(title: "로그인 성공", message: "안녕하세요 \(String(UserDefaults.standard.string(forKey: "USER_NAME")!))님", preferredStyle: .alert)
        let actionOkay = UIAlertAction(title: "확인", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(actionOkay)

        present(alert, animated: true, completion: nil)
    }
    
    func loginFailed(failedMessage: String!) {
        let alert = UIAlertController(title: failedMessage, message: nil, preferredStyle: .alert)
        let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(actionOkay)

        present(alert, animated: true, completion: nil)
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
