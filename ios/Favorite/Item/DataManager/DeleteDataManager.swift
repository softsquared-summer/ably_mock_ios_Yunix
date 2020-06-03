//
//  DeleteDataManager.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper

class DeleteDrawersDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func delteDrawers(_ favoriteItemViewController: FavoriteItemViewController, name: String, indexPath: IndexPath) {
        let headers: HTTPHeaders = ["x-access-token" : userToken!]
        let parameters: Parameters = Parameters(dictionaryLiteral: ("drawerName", name))
        Alamofire
            .request("\(self.appDelegate.baseUrl)/drawers", method: .delete, parameters: parameters, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<DeleteDrawersResponse>) in
                switch response.result {
                case .success(let deleteDrawersResponse):
                    if deleteDrawersResponse.code == 100 {
                        print(deleteDrawersResponse.message as Any)
                        favoriteItemViewController.successDelete(indexPath: indexPath)
                    } else {
                        print("정보를 불러오는데 실패하였습니다.")
                        print(deleteDrawersResponse.message)
                    }
                case .failure:
                    print("서버 연결이 원할하지 않습니다.")
                }
            })
    }
}
