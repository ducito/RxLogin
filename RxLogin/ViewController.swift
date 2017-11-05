//
//  ViewController.swift
//  RxLogin
//
//  Created by Duc Nguyen on 11/5/17.
//  Copyright © 2017 Duc Nguyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var usernameTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    private var loginViewModel = LoginViewModel()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = usernameTextfield.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.username)
        _ = passwordTextfield.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.password)
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        _ = loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.loginButton.alpha = isValid ? 1 : 0.5
        }, onError: nil, onCompleted: nil, onDisposed: nil)
    }

    @IBAction func login(_ sender: UIButton) {
        let alert = UIAlertController(title: "RxLogin", message: "Login successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true) {}
    }
}
