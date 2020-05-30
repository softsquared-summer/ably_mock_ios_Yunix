//
//  ProductInfoDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/05/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class ProductInfoDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getProductInfo(index: Int, todayViewController: TodayViewController) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/products/\(index)", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<ProductInfoResponse>) in
                switch response.result {
                case .success(let productInfoResponse):
                    if productInfoResponse.code == 100 {
                        print(productInfoResponse.message as Any)
                        todayViewController.moveProductInfoViewController(data: productInfoResponse.result)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
