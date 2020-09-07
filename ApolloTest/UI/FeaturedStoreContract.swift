//
//  FeaturedStoreContract.swift
//  ApolloTest
//
//  Created by Mohamed Abdallah on 9/6/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import Foundation


protocol FeaturedStoreViewProtocol: class{
//    func refreshTableData()
//    func didGetTableData()
    
    func didLoadStores(stores: [FragStoreAllDetailsModel], pageInfo: FragPageInfoModel)
    func displayError(message: String)
    
}

protocol FeaturedStorePresenterProtocol: class{
    
    func getFeaturedStores()
    
//    func getData(data: FeaturedStoreModel, cellNumber: Int)
//    func setCellsNumber() -> Int
//    func getDataIntoTableView()
 //   func getTableData()
}

//protocol BusinessHelperDelegate: class{
//    func didLoadData(data: FeaturedStoreModel)
//    func setCellsNumber(cellNumber: Int) 
//    func displayError()
//}
