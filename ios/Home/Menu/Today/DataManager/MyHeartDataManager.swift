//
//  MyHeartDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class MyHeartDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func postMyHeart(_ collectionViewCell: TodayCollectionViewCell, _ index: Int) {
        let headers: HTTPHeaders = ["x-access-token" : userToken!]
        Alamofire
            .request("\(self.appDelegate.baseUrl)/product-hearts/\(index)", method: .post, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<MyHeartResponse>) in
                switch response.result {
                case .success(let myHeartResponse):
                    if myHeartResponse.code == 100 {
                        print(myHeartResponse.message as Any)
                        collectionViewCell.successHeart()
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                        
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
