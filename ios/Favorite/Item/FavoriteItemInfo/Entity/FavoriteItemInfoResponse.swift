//
//  FavoriteItemInfoResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct FavoriteItemInfoResponse {
    var result: [RecommendedProductResponseResult]!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension FavoriteItemInfoResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct FavoriteItemInfoResponseResult {
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

extension FavoriteItemInfoResponseResult: Mappable {
    
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
