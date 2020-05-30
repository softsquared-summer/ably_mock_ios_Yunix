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
    
    func postRegister(_ inputUserInfoViewController: InputUserInfoViewController, _ header: HTTPHeaders) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/signUp", method: .post, headers: header)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<RegisterResponse>) in
                switch response.result {
                case .success(let registerResponse):
                    if registerResponse.code == 100 {
                        print(registerResponse.message as Any)
                        UserDefaults.standard.set(registerResponse.result.jwt, forKey: "USER_TOKEN")
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
