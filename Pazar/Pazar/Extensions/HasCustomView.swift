//
//  HasCustomView.swift
//  Pazar
//
//  Created by tsamodol on 01.09.2021..
//

import Foundation
import UIKit

public protocol HasCustomView {
    associatedtype CustomView: UIView
}

public extension HasCustomView where Self: UIViewController {
    var mainView: CustomView {
        guard let mainView = view as? CustomView else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        return mainView
    }
}
