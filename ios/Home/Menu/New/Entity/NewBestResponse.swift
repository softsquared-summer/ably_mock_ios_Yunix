//
//  NewBestResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct NewBestResponse {
    var result: ProductInfoResponseResult!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension NewBestResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct NewBestResponseResult {
    var productIdx: Int!
    var productName: String!
    var discountRatio: String!
    var displayedPrice: String!
    var productCode: String!
    var purchaseCnt: Int!
    var isMyHeart: String!
    var marketIdx: Int!
    var marketName: String!
    var isNew: String!
}

extension NewBestResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        productIdx <- map["productIdx"]
        productName <- map["productName"]
        discountRatio <- map["discountRatio"]
        displayedPrice <- map["displayedPrice"]
        productCode <- map["productCode"]
        purchaseCnt <- map["purchaseCnt"]
        isMyHeart <- map["isMyHeart"]
        marketIdx <- map["marketIdx"]
        marketName <- map["marketName"]
        isNew <- map["isNew"]
    }
    
}
