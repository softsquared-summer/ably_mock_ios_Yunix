//
//  OrderListResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct OrderListResponse {
    var result: OrderListResponseResult!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension OrderListResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct OrderListResponseResult {
    var shippingCnt: Int!
    var shippedCnt: Int!
    var cancelCnt: Int!
    var orderInfo: [OrderListResponseOrderInfo]!
}

extension OrderListResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        shippingCnt <- map["shipping"]
        shippedCnt <- map["shipped"]
        cancelCnt <- map["cancel"]
        orderInfo <- map["orderInfo"]
    }
    
}

struct OrderListResponseOrderInfo {
    var orderNum: String!
    var orderDate: String!
    var productInfo: [OrderListResponseProductInfo]!
}

extension OrderListResponseOrderInfo: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        orderNum <- map["orderNum"]
        orderDate <- map["orderDate"]
        productInfo <- map["productInfo"]
    }
    
}

struct OrderListResponseProductInfo {
    var productIdx: Int!
    var detailedProductIdx: Int!
    var thumbnailUrl: String!
    var detailedPrice: String!
    var productName: String!
    var firstOption: String!
    var secondOption: String!
    var orderStatus: Int!
    var statusName: String!
}

extension OrderListResponseProductInfo: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        productIdx <- map["productIdx"]
        detailedProductIdx <- map["detailedProductIdx"]
        thumbnailUrl <- map["thumbnailUrl"]
        detailedPrice <- map["detailedPrice"]
        productName <- map["productName"]
        firstOption <- map["firstOption"]
        secondOption <- map["secondOption"]
        orderStatus <- map["orderStatus"]
        statusName <- map["statusName"]
    }
    
}
