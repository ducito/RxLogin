//
//  LoginViewModel.swift
//  RxLogin
//
//  Created by Duc Nguyen on 11/5/17.
//  Copyright © 2017 Duc Nguyen. All rights reserved.
//

import Foundation
import RxSwift


struct LoginViewModel {
    var username = Variable<String>("")
    var password = Variable<String>("")

    var isValid: Observable<Bool> {
        return Observable.combineLatest(username.asObservable(), password.asObservable()) {
            $0.count >= 3 && $1.count >= 3
        }
    }

}
