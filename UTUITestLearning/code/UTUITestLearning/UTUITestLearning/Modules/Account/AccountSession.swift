//
//  AccountSession.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/5/7.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

struct AccountInfo {
    var userId: String
    var userToken: String
    var phoneNumber: String
    var userName: String?
    var userAvatar: String?
}

final class AccountSession: NSObject {
    
    var isSignedIn: Bool = false
    var accountInfo: AccountInfo?
    
    public static let `default` = AccountSession()
    
    private override init() {
        super.init()
        
        self.fetchLocalUserInfo()
    }
    
    fileprivate func fetchLocalUserInfo() {
        
    }
}
