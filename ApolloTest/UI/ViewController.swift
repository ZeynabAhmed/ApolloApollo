//
//  ViewController.swift
//  ApolloTest
//
//  Created by Ahmed Tarek on 9/5/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FeaturedStoreViewProtocol {

    @IBOutlet weak var featurdStoreTable: UITableView!
    var presenter: FeaturedStorePresenterProtocol?
    var fragPageInfoModel: FragPageInfoModel = FragPageInfoModel(page: 0, totalCount: 0, totalPages: 0)
    var fragStoreAllDetailsModel: [FragStoreAllDetailsModel] = [FragStoreAllDetailsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FeaturedStorePresenter(viewProtocol: self)
        featurdStoreTable.register(FeaturesStoresViewCell.nib(), forCellReuseIdentifier: FeaturesStoresViewCell.identifier)
        featurdStoreTable.tableFooterView = UIView()
        presenter=FeaturedStorePresenter(viewProtocol: self)
        refreshTableData()
        presenter?.getFeaturedStores()
        
    }

    func refreshTableData() {
        self.featurdStoreTable.reloadData()
    }

}

extension ViewController {
    func didLoadStores(stores: [FragStoreAllDetailsModel], pageInfo: FragPageInfoModel) {
        self.fragPageInfoModel = pageInfo
        self.fragStoreAllDetailsModel = stores
        refreshTableData()
    }
    
    func displayError(message: String) {
         print(" Error \(message)")
    }
 
}

// 

//extension ViewController {
//  func loadData() {
//
//    let query = HomeGetAllQuery()
//
//    Network.shared.apollo.fetch(query: query) { result in
//
//      switch result {
//      case .success(let graphQLResult):
//        if let fetchedDataItems = graphQLResult.data?.featuredStores?.items?.compactMap({$0?.fragments.fragStoreAllDetails}) {
//            for data in fetchedDataItems {
//                self.fragStoreArray.append(FragStoreAllDetailsModel(id: data.id ?? " ", name: data.name ?? " "))
//            }
//        }
//        if let fetchedDataPageInfo = graphQLResult.data?.featuredStores?.pageInfo{
//            self.fragPageInfoModel.page = fetchedDataPageInfo.fragments.fragPageInfo.page ?? 0
//            self.fragPageInfoModel.totalPages = fetchedDataPageInfo.fragments.fragPageInfo.totalPages ?? 0
//            self.fragPageInfoModel.totalCount = fetchedDataPageInfo.fragments.fragPageInfo.totalCount ?? 0
//        }
//        self.featurdStoreTable.reloadData()
//
//     case .failure(let error):
//
//        print("Error loading data \(error)")
//      }
//    }
//  }
//}

/*
 
 query HomeGetALL{
 featuredStores{
 items {
 ...fragStoreAllDetails
 }
 }

 featuredProducts{
 items{
 ...FragProduct
 }
 }

 categoriesForFront {
 items {
 ...FragCategory
 }
 }

 }
 fragment FragCategory on Category {
 id
 thumbnail

 }

 fragment fragStoreAllDetails on Store {
 id
 avatar

 }
 fragment FragProduct on ProductSummary{
 id
 thumbnail

 }

 */
