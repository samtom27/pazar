//
//  LoginViewController.swift
//  Pazar
//
//  Created by tsamodol on 31.08.2021..
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit
import FirebaseAuth

class LoginViewController: UIViewController, HasCustomView {
    typealias CustomView = LoginView


    let disposeBag = DisposeBag()
    override func loadView() {
        view = LoginView()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        mainView.button.rx.tap.bind {
            guard let email = self.mainView.emailField.text, !email.isEmpty,
                  let password = self.mainView.passwordField.text, !password.isEmpty else {
                print("fali poje")
                return
            }

      

//            print("button tapped")
//            guard let email = self.mainView.emailField.text, !email.isEmpty,
//                  let password = self.mainView.passwordField.text, !password.isEmpty else {
//                print("fali poje")
//                return
//            }
//            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password,completion: { [weak self] cresult, error in
//                guard let strongSelf = self else {
//                    return
//                }
//                guard error == nil else {
//                    strongSelf.showCreateAccount(email: email, password: password)
//                    return
//                }
//                print("ulogira si se")
//                self?.mainView.label.isHidden = true
//            })

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

}



