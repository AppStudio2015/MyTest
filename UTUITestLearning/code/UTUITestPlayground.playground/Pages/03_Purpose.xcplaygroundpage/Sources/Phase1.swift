import Foundation

// MARK : - Person1

/// 个人类
public struct Person1 {
    
    /// 名字
    public var name: String
    
    /// 性别
    public var sex: String
    
    /// 年龄
    public var age: Int
    
    /// 国家
    public var nationality: String
    
    /// 爱好
    public var hobbies: [Hobby]?
    
    /// 初始化
    /// - Parameters:
    ///   - name: 名字
    ///   - sex: 性别
    ///   - age: 年龄
    ///   - hobbies: 爱好
    public init(name: String, sex: String, age: Int, nationality: String, hobbies: [Hobby]? = nil) {
        self.name = name
        self.sex = sex
        self.age = age
        self.nationality = nationality
        self.hobbies = hobbies
    }
}

// MARK : - Extension
extension Person1 {
    
    public func description() -> Void {
        let comment: String = """
            My name is \(self.name), \(self.sex), \(self.age) years old. I am \(self.nationality).
        """
        print("\(comment)")
    }
    
    /// 是否为青少年
    /// - Returns: 是或否
    public func isTeenager() -> Bool {
        if self.age > 13, self.age < 19 {
            return true
        }
        return false
    }
    
    /// 是否有爱好
    /// - Returns: 是或否
    public func hasHobbies() -> Bool {
        return false
    }
    
    /// 吃
    /// - Parameter foods: 食物
    /// - Returns: Void
    public func eat(something foods: String) -> Void {
        print("Eat \(foods)")
    }
    
    /// 喝
    /// - Parameter drinks: 饮料
    /// - Returns: Void
    public func drink(something drinks: String) -> Void {
        print("Drink \(drinks)")
    }
}
