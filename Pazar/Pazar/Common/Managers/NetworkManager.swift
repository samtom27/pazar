//
//  NetworkManager.swift
//  Pazar
//
//  Created by tsamodol on 14.09.2021..
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate {
    func fetchProducts()  -> [Product]
}

class NetworkManager: NSObject {
    let baseURLString: String = "https://rocky-mountain-59888.herokuapp.com/getProducts"
    var delegate: NetworkManagerDelegate?

    override init() {
        super.init()
    }

    func getProducts() -> [Product] {
        var product = [Product]()
       if let url = URL(string: "hhttps://rocky-mountain-59888.herokuapp.com/getProducts") {
          URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
               do {
                 let prod = try JSONDecoder().decode([Product].self, from: data)
                 product = prod
               } catch let error {
                 print(error)
               }
            }
          }.resume()
       }
        return product
    }
}
