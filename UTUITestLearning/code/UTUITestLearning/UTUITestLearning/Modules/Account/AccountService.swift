//
//  AccountService.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/5/6.
//  Copyright © 2020 qufei. All rights reserved.
//

import struct Foundation.URL
import struct Foundation.URLRequest
import class Foundation.URLSession

#if canImport(RxSwift)
import RxSwift

// MARK: - Enum
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

// MARK: - Protocol

protocol AccountAPI {
    func phoneNumberAvailable(_ phoneNumber: String) -> Observable<Bool>
    func userNameAvailable(_ userName: String) -> Observable<Bool>
    func signin(with phoneNumber: String, password: String) -> Observable<ValidationResult>
    func signup(with phoneNumber: String, password: String) -> Observable<ValidationResult>
}

protocol AccountValidationService {
    func validateUserName(_ userName: String) -> Observable<Bool>
    func validatePhoneNumber(_ phoneNumber: String) -> Observable<Bool>
    func validatePassword(_ password: String) -> ValidationResult
    func validateConfirmPassword(_ password: String) -> ValidationResult
}

#endif

// MARK: - AccountService

/// 账号服务
/// - 注册请求
/// - 登录请求
final class AccountService: NSObject {
    
    typealias Completion = (_ data: Data?, _ error: Error?) -> (Void)
    
    /// 单例
    static let `default` = AccountService()
    
    /// 请求服务
    ///  - 可以来封闭第三方网络请求
    /// - Parameters:
    ///   - request: 请求数据
    ///   - completion: 回调方法
    class func request(with request: URLRequest, completion: @escaping Completion) {
        
        let session: URLSession = URLSession.shared
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
}

extension AccountService {
    
    /// 注册请求
    /// - Parameters:
    ///   - phoneNumber: 手机号
    ///   - password: 密码
    ///   - completion: 请求回调
    class func signup(with phoneNumber: String, password: String, completion: @escaping Completion) {
        
        let url = URL(string: "https://github.com/\(phoneNumber)")!
        let request: URLRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 5)
        
        AccountService.request(with: request, completion: completion)
    }
    
    class func validateToken(_ token: String, completion: @escaping Completion) {
        
    }
}


