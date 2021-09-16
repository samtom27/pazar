//
//  Product.swift
//  Pazar
//
//  Created by tsamodol on 14.09.2021..
//

import Foundation

struct Product: Decodable {
    let productid: Int
    let opgid: Int
    let name: String
    let price: String
    let description: String
    let image: String
    enum CodingKeys: String, CodingKey {
      case productid = "productid"
      case opgid = "opgid"
      case name = "name"
      case price = "price"
      case description = "description"
      case image = "image"
    }
}
