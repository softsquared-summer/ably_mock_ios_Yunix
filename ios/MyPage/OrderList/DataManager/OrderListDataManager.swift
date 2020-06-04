//
//  OrderListDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class OrderListDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getOrders(orderListViewController: OrderListViewController) {
        
        let headers: HTTPHeaders = ["x-access-token" : userToken!]
        
        Alamofire
            .request("\(self.appDelegate.baseUrl)/orders", method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<OrderListResponse>) in
                switch response.result {
                case .success(let OrderListResponse):
                    if OrderListResponse.code == 100 {
                        print(OrderListResponse.message as Any)
                        orderListViewController.receiveData(data: OrderListResponse.result)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                        print(OrderListResponse.message)
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
