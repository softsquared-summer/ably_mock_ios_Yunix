//
//  OrderDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class OrderDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func postOrders(_ orderViewController: OrderViewController, _ headers: HTTPHeaders, _ parameters: Parameters) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/orders", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<OrderResponse>) in
                switch response.result {
                case .success(let orderResponse):
                    if orderResponse.code == 100 {
                        orderViewController.successOrders(result: orderResponse.result.orderNum)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                        print(orderResponse.message)
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
