//
//  DrawersResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//
import ObjectMapper

struct DrawersResponse {
    var result: [DrawersResponseResult]!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension DrawersResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct DrawersResponseResult {
    var drawerIdx: Int!
    var drawerName: String!
    var productCnt: String!
    var thumbnailUrl: [String]!
}

extension DrawersResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        drawerIdx <- map["drawerIdx"]
        drawerName <- map["drawerName"]
        productCnt <- map["productCnt"]
        thumbnailUrl <- map["thumbnailUrl"]
    }
    
}
