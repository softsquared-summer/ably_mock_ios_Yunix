//
//  BannerDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class BannerDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getRecommendedProduct(_ todayViewController: TodayViewController) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/banner", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<BannerResponse>) in
                switch response.result {
                case .success(let bannerResponse):
                    if bannerResponse.code == 100 {
                        print(bannerResponse.message as Any)
                        todayViewController.receivedBanner(bannerData: bannerResponse.result)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                    let alert = UIAlertController(title: "서버와의 연결이 원활하지 않습니다.", message: nil, preferredStyle: .alert)
                    let actionOkay = UIAlertAction(title: "확인", style: .default, handler: nil)
                    
                    alert.addAction(actionOkay)

                    todayViewController.present(alert, animated: true, completion: nil)
                }
            })
    }
}
