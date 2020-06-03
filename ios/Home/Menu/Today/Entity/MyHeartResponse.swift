//
//  MyHeartResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct MyHeartResponse {
    var result: [MyHeartResponseResult]!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension MyHeartResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct MyHeartResponseResult {
    var drawerIdx: Int!
    var drawerName: String!
}

extension MyHeartResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        drawerIdx <- map["drawerIdx"]
        drawerName <- map["drawerName"]
    }
    
}
