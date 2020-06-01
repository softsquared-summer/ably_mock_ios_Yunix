//
//  LoginDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class LoginDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func postLogin(_ loginViewController: LoginViewController, _ parameters: Parameters) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/signIn", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<LoginResponse>) in
                switch response.result {
                case .success(let loginResponse):
                    if loginResponse.code == 100 {
                        print(loginResponse.message as Any)
                        UserDefaults.standard.set(loginResponse.result.jwt, forKey: "USER_TOKEN")
                        UserDefaults.standard.set(loginResponse.result.userName, forKey: "USER_NAME")
                        loginViewController.loginSuccess()
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                        loginViewController.loginFailed(failedMessage: loginResponse.message)
                    }
                case .failure:
                    let alert = UIAlertController(title: "서버와의 연결이 원활하지 않습니다.", message: nil, preferredStyle: .alert)
                    let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
                    
                    alert.addAction(actionOkay)

                    loginViewController.present(alert, animated: true, completion: nil)
                }
            })
    }
}
