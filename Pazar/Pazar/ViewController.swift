//
//  ViewController.swift
//  Pazar
//
//  Created by tsamodol on 30.08.2021..
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import FirebaseAuth

class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email Adress"
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        return emailField
    }()
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.text = "Password"
        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry = true
        passwordField.font = .systemFont(ofSize: 24, weight: .semibold)
        return passwordField
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Continue", for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        button.rx.tap.bind {
            print("button tapped")
            guard let email = self.emailField.text, !email.isEmpty,
                  let password = self.passwordField.text, !password.isEmpty else {
                print("fali poje")
                return
            }
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password,completion: { [weak self] cresult, error in
                guard let strongSelf = self else {
                    return
                }
                guard error == nil else {
                    strongSelf.showCreateAccount(email: email, password: password)
                    return
                }
                print("ulogira si se")
                strongSelf.label.isHidden = true
            })

        }.disposed(by: disposeBag)
    }
    func showCreateAccount(email: String, password: String){
        let alert = UIAlertController(title: "DSD", message: "sdsdddsd", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue",
                        style: .default,
                        handler: {_ in
                            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                                
                            })
                        }))
        alert.addAction(UIAlertAction(title: "cancle",
                                        style: .default,
                                        handler: {_ in
                                        }))
        present(alert, animated: true)
    }
    func setupSubviews() {
        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
                .offset(60)
            make.height.equalTo(40)
        }
        view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(label.snp.bottom)
            make.height.equalTo(40)
        }
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(emailField.snp.bottom)
            make.height.equalTo(40)
        }
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(passwordField.snp.bottom)
            make.height.equalTo(40)
        }
    }
}



