//
//  UserModel.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/27.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

/// 设置列表项模式
struct UserSettingData {
    
    /// 图标
    var icon: UIImage?
    
    /// 标题
    var title: String?
    
    /// 描述
    var detail: String?
}

/// 设置列表模型
enum UserSettingModel {
    case section0(_ data: [UserSettingData]?)
    case section1(_ data: [UserSettingData]?)
    case section2(_ data: [UserSettingData]?)
}

/// 用户模型
class UserModel {
    
    /// 是否登录
    var isSignin: Bool = false
    
    /// 昵称
    fileprivate var nickName: String?
    
    /// 私有示例方法
    /// - Parameter parameter: 参数
    private func privateFunc(parameter: String) {
        print("PrivateFunc")
    }
}

extension UserModel {
    
    /// 获取默认设置项数据
    /// - Returns: 默认设置项数据
    class func defaultSettingModel() -> UserSettingModel {
        let data: [UserSettingData] = [
            UserSettingData(icon: nil, title: "Title1", detail: "Detail1"),
            UserSettingData(icon: nil, title: "Title2", detail: "Detail2"),
            UserSettingData(icon: nil, title: "Title3", detail: "Detail3"),
            UserSettingData(icon: nil, title: "Title4", detail: "Detail4"),
            UserSettingData(icon: nil, title: "Title5", detail: "Detail5"),
            UserSettingData(icon: nil, title: "Title6", detail: "Detail6"),
            UserSettingData(icon: nil, title: "Title7", detail: "Detail7"),
            UserSettingData(icon: nil, title: "Title8", detail: "Detail8"),
            UserSettingData(icon: nil, title: "Title9", detail: "Detail9"),
            UserSettingData(icon: nil, title: "Title10", detail: "Detail10")
        ]
        let model = UserSettingModel.section0(data)
        return model
    }
    
    /// 公有示例方法
    /// - Returns: 无
    public func publicFunc() -> Void {
        print("publicFunc")
    }
}

extension UserModel {
    
    /// 文件内私有示例方法
    /// - Returns: 无
    fileprivate func fileprivateFunc() -> Void {
        print("fileprivateFunc")
    }
}

//#if DEBUG
//extension UserModel {
//    var testNickName: String? {
//        get {
//            return self.nickName
//        }
//    }
//
//    func testFileprivateFunc() {
//        self.fileprivateFunc()
//    }
//
//    func testPrivateFunc(parameter: String) {
//        self.privateFunc(parameter: parameter)
//    }
//}
//#endif
