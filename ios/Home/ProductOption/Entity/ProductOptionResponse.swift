//
//  ProductOptionResponse.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct ProductOptionResponse {
    var result: [ProductOptionResponseResult]!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension ProductOptionResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct ProductOptionResponseResult {
    var detailedProductIdx: Int!
    var firstOption: String!
    var secondOption: String!
    var detailedPrice: Int!
    var stock: Int!
}

extension ProductOptionResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        detailedProductIdx <- map["detailedProductIdx"]
        firstOption <- map["firstOption"]
        secondOption <- map["secondOption"]
        detailedPrice <- map["detailedPrice"]
        stock <- map["stock"]
    }
}

