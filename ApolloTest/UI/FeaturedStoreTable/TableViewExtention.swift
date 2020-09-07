//
//  TableViewExtention.swift
//  ApolloTest
//
//  Created by Ahmed Tarek on 9/5/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(" numberOfRowsInSection  \(presenter?.setCellsNumber())  ")
//        return presenter?.setCellsNumber() ?? 0
        return fragStoreAllDetailsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = featurdStoreTable.dequeueReusableCell(withIdentifier: FeaturesStoresViewCell.identifier, for: indexPath) as! FeaturesStoresViewCell
        cell.setFeaturedStroeData(featuredStoreData: fragStoreAllDetailsModel[indexPath.row])
        cell.setfragPageInfo(featuredStoreData: fragPageInfoModel)
        print(" count \(fragStoreAllDetailsModel.count)  ")
//        cell.setFeaturedStroeData(featuredStoreData: fragStoreArray[indexPath.row], pageInfoData: fragPageInfoModel)
        return cell
    }
    
}

