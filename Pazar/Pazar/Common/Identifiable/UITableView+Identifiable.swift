//
//  UITableView+Identifiable.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) where T: ClassIdentifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseId)
    }

    func register<T: UIView>(headerFooterViewType: T.Type) where T: ClassIdentifiable {
        register(headerFooterViewType.self, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseId)
    }

    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId) as? T else {
            fatalError("Couldn't dequeue \(T.self) with identifier \(type.reuseId)")
        }
        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, forIndexPath indexPath: IndexPath) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId, for: indexPath) as? T else { fatalError("Couldn't dequeue \(T.self) with identifier \(type.reuseId)") }
        return cell
    }
}
