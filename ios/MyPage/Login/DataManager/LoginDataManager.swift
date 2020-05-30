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
    
    func postLogin(_ loginViewController: LoginViewController, _ header: HTTPHeaders) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/signIn", method: .post, headers: header)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<LoginResponse>) in
                switch response.result {
                case .success(let loginResponse):
                    if loginResponse.code == 100 {
                        print(loginResponse.message as Any)
//                        UserDefaults.standard.set(loginResponse.result.jwt, forKey: "USER_TOKEN")
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
