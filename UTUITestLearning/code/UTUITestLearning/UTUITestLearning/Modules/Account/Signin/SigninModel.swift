//
//  LoginModel.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

// MARK: -
protocol SigninModelProtocol {
    
    typealias SigninCompletion = (_ signedIn: Bool, _ accountInfo: AccountInfo?) -> (Void)
    
    /// 登录请求
    /// - Parameters:
    ///   - phoneNumber: 手机号
    ///   - password: 密码
    ///   - completionHandler: 请求回调
    func signin(with phoneNumer: String, password: String, completionHandler: @escaping SigninCompletion)
}

// MARK: - SigninModel

/// 用户登录模型
final class SigninModel: NSObject {
    
    var signinCompletionHandler: SigninCompletion?
}

extension SigninModel {
    
    /// 处理登录返回结果
    /// - Parameters:
    ///   - data: 数据
    ///   - error: 错误
    fileprivate func handleSigninResponseData(_ data: Data?, error: Error?) {
        if let anError = error {
            print("Sigin failed: \(anError)")
            self.signinCompletionHandler?(false, nil)
            return
        }
        
        guard let aData = data else {
            self.signinCompletionHandler?(false, nil)
            return
        }
        print("Signin success\(aData)")
        
        // Parse data
        
        // Construct account information
        let accInfo: AccountInfo = AccountInfo(userId: "123456", userToken: "qazwsxcde", phoneNumber: "12345678900", userName: "Tony", userAvatar: "ic_person_48pt")
        
        // Call completion closure
        self.signinCompletionHandler?(true, accInfo)
    }
}

extension SigninModel: SigninModelProtocol {
    
    /// 登录请求
    /// - Parameters:
    ///   - phoneNumber: 手机号
    ///   - password: 密码
    ///   - completionHandler: 请求回调
    func signin(with phoneNumber: String, password: String, completionHandler: @escaping SigninCompletion) {
        self.signinCompletionHandler = completionHandler
        
        let url = URL(string: "https://github.com/\(phoneNumber)")!
        let request: URLRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 5)
        
        AccountService.request(with: request, completion: { [unowned self](data, error) in
            self.handleSigninResponseData(data, error: error)
        })
    }
}

#if DEBUG
extension SigninModel: PrivateTestable {
    func testHandleSigninResponseData(_ data: Data?, error: Error?) {
        return self.handleSigninResponseData(data, error: error)
    }
}
#endif
