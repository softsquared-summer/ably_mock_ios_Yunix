//
//  LoginResponse.swift
//  ios
//
//  Created by 이한길 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct LoginResponse {
    var result: LoginResponseResult!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension LoginResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct LoginResponseResult {
    var jwt: String!
    var userIdx: Int!
    var userName: String!
}

extension LoginResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        jwt <- map["jwt"]
        userIdx <- map["userIdx"]
        userName <- map["userName"]
    }
    
}
