//
//  RecommendedProductResponse.swift
//  ios
//
//  Created by 이한길 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct ProductInfoResponse {
    var result: ProductInfoResponseResult!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension ProductInfoResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct ProductInfoResponseResult {
    var productIdx: Int!
    var productName: String!
    var discountRatio: String!
    var displayedPrice: String!
    var price: String!
    var productCode: String!
    var purchaseCnt: Int!
    var contents: String!
    var isMyHeart: String!
    var marketIdx: Int!
    var marketName: String!
    var marketHashTags: String!
    var marketThumbnailUrl: String!
    var mainImgUrlList: [String]!
    var normalImgUrlList: [String]!
}

extension ProductInfoResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        productIdx <- map["productIdx"]
        productName <- map["productName"]
        discountRatio <- map["discountRatio"]
        displayedPrice <- map["displayedPrice"]
        price <- map["price"]
        productCode <- map["productCode"]
        purchaseCnt <- map["purchaseCnt"]
        contents <- map["contents"]
        isMyHeart <- map["isMyHeart"]
        marketIdx <- map["marketIdx"]
        marketName <- map["marketName"]
        marketHashTags <- map["marketHashTags"]
        marketThumbnailUrl <- map["marketThumbnailUrl"]
        mainImgUrlList <- map["mainImgUrlList"]
        normalImgUrlList <- map["normalImgUrlList"]
    }
    
}
