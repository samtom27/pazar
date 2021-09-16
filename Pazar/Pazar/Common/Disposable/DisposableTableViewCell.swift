//
//  DisposableTableViewCell.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import RxSwift
import UIKit

class DisposableTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
