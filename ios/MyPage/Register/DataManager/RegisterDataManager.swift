//
//  RegisterDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class RegisterDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func postRegister(_ inputUserInfoViewController: InputUserInfoViewController, _ parameters: Parameters) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/signUp", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<RegisterResponse>) in
                switch response.result {
                case .success(let registerResponse):
                    if registerResponse.code == 100 {
                        print(registerResponse.message as Any)
                        UserDefaults.standard.set(registerResponse.result.jwt, forKey: "USER_TOKEN")
                        inputUserInfoViewController.registerSuccess()
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                        inputUserInfoViewController.registerFailed(failedMessage: registerResponse.message)
                    }
                case .failure:
                    let alert = UIAlertController(title: "서버와의 연결이 원활하지 않습니다.", message: nil, preferredStyle: .alert)
                    let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
                    
                    alert.addAction(actionOkay)

                    inputUserInfoViewController.present(alert, animated: true, completion: nil)
                }
            })
    }
}
