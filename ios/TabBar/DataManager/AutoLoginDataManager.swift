//
//  AutoLoginDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireObjectMapper

class AutoLoginDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getAutoLogin(_ tabBarController: TabBarController, _ userToken: String!, _ userName: String!) {
        let headers: HTTPHeaders = ["x-access-token" : userToken]
        Alamofire
            .request("\(self.appDelegate.baseUrl)/signIn", method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<AutoLoginResponse>) in
                switch response.result {
                case .success(let loginResponse):
                    if loginResponse.code == 100 {
                        let alert = UIAlertController(title: "안녕하세요 \(userName!)님", message: "자동 로그인 되었습니다.", preferredStyle: .alert)
                        let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
                        
                        alert.addAction(actionOkay)

                        tabBarController.present(alert, animated: true, completion: nil)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                    }
                case .failure:
                    let alert = UIAlertController(title: "서버와의 연결이 원활하지 않습니다.", message: nil, preferredStyle: .alert)
                    let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
                    
                    alert.addAction(actionOkay)

                    tabBarController.present(alert, animated: true, completion: nil)
                }
            })
    }
}
