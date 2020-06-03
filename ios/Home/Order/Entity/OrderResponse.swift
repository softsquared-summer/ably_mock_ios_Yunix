//
//  OrderResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct OrderResponse {
    var result: OrderResponseResult!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension OrderResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct OrderResponseResult {
    var orderNum: String!
}

extension OrderResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        orderNum <- map["orderNum"]
    }
}


