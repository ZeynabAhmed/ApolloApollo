//
//  BusinessHelper.swift
//  ApolloTest
//
//  Created by Mohamed Abdallah on 9/6/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import Foundation
import Apollo
import RxSwift

class BusinessHelper{
    
    var fragPageInfoModel: FragPageInfoModel = FragPageInfoModel(page: 0, totalCount: 0, totalPages: 0)
    var fragStoreArray=[FragStoreAllDetailsModel]()
    var featuredStoreModel: FeaturedStoreModel!
    
    var lastConnection:  HomeGetAllQuery.Data.FeaturedStores.PageInfo?
    private var activeRequest: Cancellable?
    
    func loadStores(page: Int?)-> Observable<FeaturedStoreModel> {
        let subject = PublishSubject<FeaturedStoreModel>()
        let query = HomeGetAllQuery(paginate: page)
        Network.shared.apollo.fetch(query: query) { result in
        
            switch result {
            case .success(let graphQLResult):
              if let fetchedDataItems = graphQLResult.data?.featuredStores?.items?.compactMap({$0?.fragments.fragStoreAllDetails}) {
                  for data in fetchedDataItems {
                      self.fragStoreArray.append(FragStoreAllDetailsModel(id: data.id ?? " ", name: data.name ?? " "))
                  }
               print("fetchedDataItems")
              }
              if let fetchedDataPageInfo = graphQLResult.data?.featuredStores?.pageInfo{
                  self.fragPageInfoModel.page = fetchedDataPageInfo.fragments.fragPageInfo.page ?? 0
                  self.fragPageInfoModel.totalPages = fetchedDataPageInfo.fragments.fragPageInfo.totalPages ?? 0
                  self.fragPageInfoModel.totalCount = fetchedDataPageInfo.fragments.fragPageInfo.totalCount ?? 0
              }
              
              subject.onNext(FeaturedStoreModel(FragStoreArray: self.fragStoreArray, pageInfo: self.fragPageInfoModel))
              //self.delegate?.setCellsNumber(cellNumber: self.fragStoreArray.count)
              if let errors = graphQLResult.errors {
                    subject.onError(error)
            }
            case .failure(let error):
                subject.onError(error)
              print("Error loading data \(error)")
              //self.delegate?.displayError()
            }
          }

         
        
        return subject.asObservable()
    }
    
//    func loadData(){
//
//       let query = HomeGetAllQuery()
//
//       Network.shared.apollo.fetch(query: query) { result in
//
//         switch result {
//         case .success(let graphQLResult):
//           if let fetchedDataItems = graphQLResult.data?.featuredStores?.items?.compactMap({$0?.fragments.fragStoreAllDetails}) {
//               for data in fetchedDataItems {
//                   self.fragStoreArray.append(FragStoreAllDetailsModel(id: data.id ?? " ", name: data.name ?? " "))
//               }
//            print("fetchedDataItems")
//           }
//           if let fetchedDataPageInfo = graphQLResult.data?.featuredStores?.pageInfo{
//               self.fragPageInfoModel.page = fetchedDataPageInfo.fragments.fragPageInfo.page ?? 0
//               self.fragPageInfoModel.totalPages = fetchedDataPageInfo.fragments.fragPageInfo.totalPages ?? 0
//               self.fragPageInfoModel.totalCount = fetchedDataPageInfo.fragments.fragPageInfo.totalCount ?? 0
//           }
//
//           self.delegate?.getData(data: FeaturedStoreModel(FragStoreArray: self.fragStoreArray, pageInfo: self.fragPageInfoModel))
//           self.delegate?.setCellsNumber(cellNumber: self.fragStoreArray.count)
//         case .failure(let error):
//
//           print("Error loading data \(error)")
//           self.delegate?.displayError()
//         }
//       }
//
//        print("-------\(fragStoreArray)---\(fragPageInfoModel)")
//     }
}


// view
  //  var

// presenter
  //  loadData( data )  take var value to view  --- then refresh

// helper
  //  loadData()  ----  call presenter   data
