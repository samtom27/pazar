//
//  HomeViewModel.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import Foundation
import RxCocoa
import RxDataSources
import RxSwift
import UIKit.UIImage
import XCoordinator
import Alamofire

struct ProductSectionModel {
    var header: String
    var items: [ProductCellViewModel]
}

extension ProductSectionModel: SectionModelType {
    typealias Item = ProductCellViewModel

    init(original: ProductSectionModel, items: [Item]) {
        self = original
        self.items = items
    }
}
protocol ProductDataManagentViewModelOutput {
    var title: String? { get }
    var items: BehaviorRelay<[ProductSectionModel]> { get }
}

protocol ProductDataManagentViewModelInput {

}

extension HomeViewModel {
    var input: ProductDataManagentViewModelInput { self }
    var output: ProductDataManagentViewModelOutput { self }
}

class HomeViewModel: DisposableViewModel, ProductDataManagentViewModelOutput, ProductDataManagentViewModelInput {

    var title: String?
    var items: BehaviorRelay<[ProductSectionModel]>
    private var filteredProducts = [Product]()
    private let router: StrongRouter<GameManagmentRoute>
    var detailsTrigger = PublishSubject<Product>()

    init(router: StrongRouter<GameManagmentRoute>) {
        self.router = router
        self.items = .init(value: [])
        super.init()
        bindTriggers()

//        filteredGames = fetchData()
        filteredProducts.append(Product(productid: 2, opgid: 4, name: "sad", price: "fdfds", description: "dafdsfadf", image: "https://thumbs.dreamstime.com/z/salat-25773840.jpg"))
        filteredProducts.append(Product(productid: 3, opgid: 4, name: "safsdd", price: "fdfds", description: "dafdsfadf", image: "https://2.bp.blogspot.com/-Itx-urYoeyk/U_mn8cnA0xI/AAAAAAAABE8/1_a0CioIVpU/s1600/Cucumber.jpg"))
        filteredProducts.append(Product(productid: 4, opgid: 4, name: "sadhh", price: "fdfds", description: "dafdsfadf", image: "https://pbs.twimg.com/profile_images/378800000327927226/db014211c8f9c77172456c10e9a30cf2.png"))
        filteredProducts.append(Product(productid: 5, opgid: 4, name: "sadhh", price: "fdfds", description: "dafdsfadf", image: "https://thumbs.dreamstime.com/z/salat-25773840.jpg"))
        
        updateItems()
        
    }

    public func updateItems() {
        let productViewModels = filteredProducts.map { prod in
            return ProductCellViewModel(detailsLabel: detailsTrigger, product: prod)
        }
        let items = [ProductSectionModel(header: "", items: productViewModels)]
        
        self.items.accept(items)
    }

    func fetchData() -> [Product] {
        var p = [Product]()
       if let url = URL(string: "https://rocky-mountain-59888.herokuapp.com/getProducts") {
          URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
               do {
                 let prod = try JSONDecoder().decode([Product].self, from: data)
                 p = prod
               } catch let error {
                 print(error)
               }
            }
          }.resume()
       }
        return p
    }






    private func bindTriggers() {
        detailsTrigger.subscribe(onNext: { [weak self] product in
            guard let self = self else { return }
            self.router.trigger(.gameManagment)
            
        }).disposed(by: disposeBag)
    }
}

