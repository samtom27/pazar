//
//  ClassIdentifiable.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import UIKit

protocol ClassIdentifiable: AnyObject {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    static var reuseId: String {
        String(describing: self)
    }
}
