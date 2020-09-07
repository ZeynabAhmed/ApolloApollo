//
//  Model.swift
//  ApolloTest
//
//  Created by Ahmed Tarek on 9/5/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import Foundation

struct FeaturedStoreModel {
    var FragStoreArray:[FragStoreAllDetailsModel]
    var pageInfo:FragPageInfoModel
}

struct FeaturedStoreAllDataModel{
    var featuredStoreModel: FeaturedStoreModel!
    var cellsNumber: Int!
    
    init(data: FeaturedStoreModel, cellsNum: Int) {
        self.cellsNumber = cellsNum
        self.featuredStoreModel = data
    }
    
}

struct FragStoreAllDetailsModel{
    var id: String
    var name: String
}

struct FragPageInfoModel{
    var page: Int
    var totalCount: Int
    var totalPages: Int
}
