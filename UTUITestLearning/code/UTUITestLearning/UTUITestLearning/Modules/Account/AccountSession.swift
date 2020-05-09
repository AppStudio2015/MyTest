//
//  AccountSession.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/5/7.
//  Copyright © 2020 qufei. All rights reserved.
//

import Foundation

// MARK: - AccountInfo
struct AccountInfo {
    var userId: String
    var userToken: String
    var phoneNumber: String
    var userName: String?
    var userAvatar: String?
}

extension AccountInfo: Equatable {
    static func == (lhs: AccountInfo, rhs: AccountInfo) -> Bool {
        return lhs.userId == rhs.userId
    }
}

// MARK: - AccountSession

final class AccountSession: NSObject {
    
    /// 是否已登录
    var isSignedIn: Bool = false
    
    /// 是否已注册
    var isSignedUp: Bool = false
    
    /// 账号信息
    var accountInfo: AccountInfo?
    
    /// 单例
    public static let `default` = AccountSession()
    
    
    private override init() {
        super.init()
        
//        self.fetchLocalAccountInfo()
    }
}

extension AccountSession {
    
    /// 获取本地保存账号信息
    /// - Returns: 账号信息
    @discardableResult
    fileprivate func fetchLocalAccountInfo() -> AccountInfo? {
        return nil
    }
    
    @discardableResult
    fileprivate func fetchLocalToken() -> String? {
        return nil
    }
    
    fileprivate func storeToken(_ token: String) {
        
    }
}
