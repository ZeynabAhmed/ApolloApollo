//
//  FeaturesStoresViewCell.swift
//  ApolloTest
//
//  Created by Ahmed Tarek on 9/5/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import UIKit

class FeaturesStoresViewCell: UITableViewCell {

    @IBOutlet weak var totalpages: UILabel!
    @IBOutlet weak var page: UILabel!
    @IBOutlet weak var totalCount: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    
    static let identifier = "FeaturesStoresViewCell"
    
     static func nib() -> UINib{
         return UINib(nibName: "FeaturesStoresViewCell", bundle: nil)
     }
    
//    func setFeaturedStroeData (featuredStoreData: FeaturedStoreModel){
//        id.text = "Id : \(featuredStoreData.id)"
//        name.text = "Name : \(featuredStoreData.name)"
//        totalCount.text = "TotalC : \(pageInfoData.totalCount)"
//        page.text = "Page : \(pageInfoData.page)"
//        totalpages.text = "TotalP : \(pageInfoData.totalPages)"
//    }
    
    func setFeaturedStroeData (featuredStoreData: FragStoreAllDetailsModel){
        id.text = "Id : \(featuredStoreData.id)"
        name.text = "Name : \(featuredStoreData.name)"

    }
    
    func setfragPageInfo (featuredStoreData: FragPageInfoModel){
        totalCount.text = "TotalC : \(featuredStoreData.totalCount)"
        page.text = "Page : \(featuredStoreData.page)"
        totalpages.text = "TotalP : \(featuredStoreData.totalPages)"
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
