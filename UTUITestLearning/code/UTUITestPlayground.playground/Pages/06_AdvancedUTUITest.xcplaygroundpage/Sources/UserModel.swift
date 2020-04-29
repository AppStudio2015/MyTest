//: UserModel

import UIKit

struct UserSettingData {
    var icon: UIImage?
    var title: String?
    var detail: String?
}

enum UserSettingModel {
    case section0(_ data: [UserSettingData]?)
    case section1(_ data: [UserSettingData]?)
    case section2(_ data: [UserSettingData]?)
}

class UserModel {
    private func privateFunc(parameter: String) {
        print("PrivateFunc")
    }
}

extension UserModel {
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
}

extension UserModel {
    fileprivate func fileprivateFunc() -> Void {
        print("fileprivateFunc")
    }
}

#if DEBUG
extension UserModel {
    
    var testNickName: String? {
        get {
            return self.nickName
        }
    }
    
    func testFileprivateFunc() {
        self.fileprivateFunc()
    }
    
    func testPrivateFunc(parameter: String) {
        self.privateFunc(parameter: parameter)
    }
}
#endif

