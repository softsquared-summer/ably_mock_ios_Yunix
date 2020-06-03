//
//  DeleteDrawersResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct DeleteDrawersResponse {
    var result: String!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension DeleteDrawersResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}
