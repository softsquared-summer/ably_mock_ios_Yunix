//
//  DrawersDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireObjectMapper

class DrawersDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getDrawers(_ favoriteItemViewController: FavoriteItemViewController) {
        let headers: HTTPHeaders = ["x-access-token" : userToken!]
        Alamofire
            .request("\(self.appDelegate.baseUrl)/drawers", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<DrawersResponse>) in
                switch response.result {
                case .success(let drawersResponse):
                    if drawersResponse.code == 100 {
                        print(drawersResponse.message as Any)
                        favoriteItemViewController.receiveDrawers(data: drawersResponse.result)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                    }
                case .failure:
                    print("서버 연결이 원할하지 않습니다.")
                }
            })
    }
}
