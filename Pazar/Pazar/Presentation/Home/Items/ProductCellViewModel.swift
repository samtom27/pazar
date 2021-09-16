//
//  GameManagentCellViewModel.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import Foundation
import RxCocoa
import RxSwift
import UIKit.UIImage
import XCoordinator

protocol ProductViewModelOutput {
    var productid: Driver<Int?> { get }
    var opgid: Driver<Int?> { get }
    var name: Driver<String?> { get }
    var price: Driver<String?> { get }
    var image: Driver<URL?> { get }
    
}
protocol ProductCellViewModelInput {
    var detailsTrigger: PublishSubject<Void> { get }
}

extension ProductCellViewModel {
    var output: ProductViewModelOutput { self }
    var input: ProductCellViewModelInput { self }
}

class ProductCellViewModel: DisposableViewModel, ProductViewModelOutput, ProductCellViewModelInput {

    let detailsTrigger = PublishSubject<Void>()
    var productid: Driver<Int?>
    var opgid: Driver<Int?>
    var name: Driver<String?>
    var price: Driver<String?>
    let image: Driver<URL?>
    let product: Product

    init(detailsLabel: PublishSubject<Product>,
         product: Product) {

        self.productid = .just(product.productid)
        self.opgid = .just(product.opgid)
        self.name = .just(product.name)
        self.price = .just(product.price)
        self.image = .just(URL(string: product.image))
        self.product = product
        super.init()

        self.detailsTrigger
            .map({ self.product})
            .bind(to: detailsLabel)
            .disposed(by: disposeBag)
    }
}
