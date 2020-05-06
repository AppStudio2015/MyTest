//
//  AccountService.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/5/6.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit
#if canImport(RxSwift)
import RxSwift
#endif

enum ValidationResult {
    case ok(message: String)
    case empty
    case validating
    case failed(message: String)
}

enum SignState {
    case signedUp(signedUp: Bool)
    case signedIn(signedIn: Bool)
}

protocol AccountAPI {
    associatedtype Observable
    func phoneNumberAvailable(_ phoneNumber: String) -> Observable
    func userNameAvailable(_ userName: String) -> Observable
    func signin(with phoneNumber: String, password: String) -> Observable
    func signup(with phoneNumber: String, password: String) -> Observable
}

protocol AccountValidationService {
    associatedtype Observable
    func validateUserName(_ userName: String) -> Observable
    func validatePhoneNumber(_ phoneNumber: String) -> Observable
    func validatePassword(_ password: String) -> ValidationResult
    func validateConfirmPassword(_ password: String) -> ValidationResult
}

class AccountService: NSObject {

}
