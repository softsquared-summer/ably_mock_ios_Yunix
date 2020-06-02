//
//  BannerResponse.swift
//  ios
//
//  Created by 이한길 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct BannerResponse {
    var result: [BannerResponseResult]!
    var code: Int!
    var isSuccess: Bool!
    var message: String!
}

extension BannerResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        result <- map["result"]
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
    }
    
}

struct BannerResponseResult {
    var bannerIdx: Int!
    var bannerName: String!
    var bannerUrl: String!
}

extension BannerResponseResult: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        bannerIdx <- map["bannerIdx"]
        bannerName <- map["bannerName"]
        bannerUrl <- map["bannerUrl"]
    }
    
}
