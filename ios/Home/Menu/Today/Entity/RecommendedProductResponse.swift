//
//  RecommendedProductResponse.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct RecommendedProductResponse {
    var result: [RecommendedProductResponseResult]!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension RecommendedProductResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct RecommendedProductResponseResult {
    var index: Int!
    var imgageUrl: String!
    var sale: String!
    var price: String!
    var marketName: String!
    var productName: String!
    var count: String!
    var isHotDeal: String!
    var isNew: String!
    var isMyHeart: String!
}

extension RecommendedProductResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        index <- map["productIdx"]
        imgageUrl <- map["thumbnailUrl"]
        sale <- map["discountRatio"]
        price <- map["displayedPrice"]
        marketName <- map["marketName"]
        productName <- map["productName"]
        count <- map["purchaseCnt"]
        isHotDeal <- map["isHotDeal"]
        isNew <- map["isNew"]
        isMyHeart <- map["isMyHeart"]
    }
    
}
