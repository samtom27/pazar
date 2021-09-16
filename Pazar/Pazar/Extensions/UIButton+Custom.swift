//
//  UIButton+Custom.swift
//  Pazar
//
//  Created by tsamodol on 15.09.2021..
//

import RxCocoa
import RxSwift
import UIKit

public enum CustomButtonType {
    case switchButton
    case favoriteButton
    case primaryActionButton
    case secondaryActionButton
    case tertiaryActionButton
    case formFieldErrorButton
    case formPasswordVisibilityButton
    case checkbox
    case pickerButton
}

extension UIButton {
    func configure(type: CustomButtonType) {
        configureColors(type: type)
        configureFont(type: type)
        configureCorners(type: type)
    }

    fileprivate func configureColors(type: CustomButtonType) {
        switch type {
        case .primaryActionButton:
            backgroundColor = UIColor(named: "secondaryText")
            setTitleColor(UIColor(named: "accentColor"), for: .normal)
        case .secondaryActionButton:
            backgroundColor = UIColor(named: "secondaryText")
            setTitleColor(UIColor(named: "accentColor"), for: .normal)
        case .tertiaryActionButton:
            backgroundColor = UIColor(named: "accentColor")
            setTitleColor(UIColor(named: "accentColor"), for: .normal)
        case .checkbox:
            backgroundColor = .clear
            setTitleColor(UIColor(named: "accentColor"), for: .normal)
        case .pickerButton:
            backgroundColor = UIColor(named: "accentColor")
            setTitleColor(UIColor(named: "accentColor"), for: .normal)
        default:
            backgroundColor = .clear
        }
    }


    fileprivate func configureFont(type: CustomButtonType) {
        switch type {
        case .primaryActionButton, .secondaryActionButton, .tertiaryActionButton, .checkbox, .pickerButton:
            titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        default:
            break
        }
    }

    fileprivate func configureCorners(type: CustomButtonType) {
        layer.masksToBounds = true

        switch type {
        case .primaryActionButton, .secondaryActionButton, .tertiaryActionButton, .pickerButton:
            layer.cornerRadius = 2
        default:
            layer.cornerRadius = 0
        }
    }
}

public extension Reactive where Base: UIButton {
    var configuration: Binder<CustomButtonType> {
        Binder(base) { button, type in
            button.configure(type: type)
        }
    }
}
