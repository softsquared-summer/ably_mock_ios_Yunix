//
//  File.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class TodayDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getRecommendedProduct(_ todayViewController: TodayViewController) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/recommended-products", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<RecommendedProductResponse>) in
                switch response.result {
                case .success(let recommendedProductResponse):
                    if recommendedProductResponse.code == 100 {
                        print(recommendedProductResponse.message as Any)
                        todayViewController.recommendData = recommendedProductResponse.result
                        todayViewController.collectionView.reloadData()
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
