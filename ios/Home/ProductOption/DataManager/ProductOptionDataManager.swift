//
//  ProductOptionDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class ProductOptionDataManager {
    var firstOptionList: [String]! = []
    var optionDictionary: [String : [String]]! = [:]
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getProductOption(_ productOptionViewController: ProductOptionViewController, _ index: Int) {
        Alamofire
            .request("\(self.appDelegate.baseUrl)/products/\(index)/options", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<ProductOptionResponse>) in
                switch response.result {
                case .success(let productOptionResponse):
                    if productOptionResponse.code == 100 {
                        print(index)
                        print(productOptionResponse.message as Any)
                        for i in productOptionResponse.result {
                            if !self.firstOptionList.contains(i.firstOption) {
                                self.firstOptionList.append(i.firstOption)
                                if self.optionDictionary[i.firstOption] == nil {
                                    self.optionDictionary[i.firstOption] = []
                                }
                                
                            }
                            self.optionDictionary[i.firstOption]?.append(i.secondOption)
                        }
                        productOptionViewController.receiveData(result: productOptionResponse.result, firstOptionList: self.firstOptionList, optionDictionary: self.optionDictionary)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                    }
                case .failure:
                    print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
