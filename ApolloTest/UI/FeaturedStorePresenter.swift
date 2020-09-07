//
//  FeaturedStorePresenter.swift
//  ApolloTest
//
//  Created by Mohamed Abdallah on 9/6/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import Foundation
import RxSwift

class FeaturedStorePresenter: NSObject, FeaturedStorePresenterProtocol{
   
    weak var view: FeaturedStoreViewProtocol?
    let disposeBag = DisposeBag()
    let pageNumber = 0

    init(viewProtocol: ViewController){
        super.init()
        self.view = viewProtocol
    }
    
    func getFeaturedStores() {
        let helper = BusinessHelper()
        helper.loadStores(pageNumber += 1).subscribe(onNext: { (result) in
            self.view?.didLoadStores(stores: result.FragStoreArray, pageInfo: result.pageInfo)
        }, onError: { (error) in
            self.view?.displayError(message: error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func displayError() {
        print("Erorr in Loding Data")
    }
}












 /*
 func getTableData() {
     DispatchQueue.main.asyncAfter(deadline: .now()) {
         let data = [Any]()
         self.view?.didGetTableData()
     }
 }
 */
