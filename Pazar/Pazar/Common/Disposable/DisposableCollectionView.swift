//
//  DisposableCollectionView.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import RxSwift
import UIKit

class DisposableCollectionView: UICollectionView {
    var disposeBag = DisposeBag()
}
