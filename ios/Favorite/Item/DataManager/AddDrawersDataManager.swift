//
//  AddDrawersDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class AddDrawersDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func postDrawers(_ favoriteItemViewController: FavoriteItemViewController, name: String) {
        let headers: HTTPHeaders = ["x-access-token" : userToken!]
        let parameters: Parameters = Parameters(dictionaryLiteral: ("drawerName", name))
        Alamofire
            .request("\(self.appDelegate.baseUrl)/drawers", method: .post, parameters: parameters, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<AddDrawersResponse>) in
                switch response.result {
                case .success(let addDrawersResponse):
                    if addDrawersResponse.code == 100 {
                        print(addDrawersResponse.message as Any)
                        favoriteItemViewController.receiveAddDrawers(title: name)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                        print(addDrawersResponse.message)
                    }
                case .failure:
                    print("서버 연결이 원할하지 않습니다.")
                }
            })
    }
}
