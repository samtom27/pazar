//
//  LoginView.swift
//  Pazar
//
//  Created by tsamodol on 01.09.2021..
//

import Foundation
import RxCocoa
import RxSwift
import SnapKit
import UIKit

class LoginView: UIView {
    private var loginView: UIView!

    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()

    let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email Adress"
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        return emailField
    }()

    let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.text = "Password"
        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry = true
        passwordField.font = .systemFont(ofSize: 24, weight: .semibold)
        return passwordField
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Continue", for: .normal)
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(label)
        label.snp.makeConstraints { make in
                make.left.right.top.equalToSuperview()
                    .offset(60)
                make.height.equalTo(40)
            }
        addSubview(emailField)
            emailField.snp.makeConstraints { make in
                make.left.right.equalToSuperview()
                make.top.equalTo(label.snp.bottom)
                make.height.equalTo(40)
            }
        addSubview(passwordField)
            passwordField.snp.makeConstraints { make in
                make.left.right.equalToSuperview()
                make.top.equalTo(emailField.snp.bottom)
                make.height.equalTo(40)
            }
        addSubview(button)
            button.snp.makeConstraints { make in
                make.left.right.equalToSuperview()
                make.top.equalTo(passwordField.snp.bottom)
                make.height.equalTo(40)
            }
        }

}
