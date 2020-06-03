//
//  AddDrawersResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct AddDrawersResponse {
    var result: [AddDrawersResponseResult]!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension AddDrawersResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct AddDrawersResponseResult {
    var drawerIdx: Int!
}

extension AddDrawersResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        drawerIdx <- map["drawerIdx"]
    }
    
}
