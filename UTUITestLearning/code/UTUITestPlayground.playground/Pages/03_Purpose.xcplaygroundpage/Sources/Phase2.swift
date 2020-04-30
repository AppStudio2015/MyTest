import Foundation

// MARK: - Sex
/// 性别
public enum Sex {
    /// 男性
    case male
    /// 女性
    case female
    /// 其它
    case other(String)
}

// MARK: - Nationality

/// 国籍
public enum Nationality {
    /// 中国
    case Chinese
    /// 日本
    case Japanese
    /// 泰国
    case Thailand
    
    // case ...
    
    /// 多国籍
    case Multi([Self])
}

// MARK: - Hobby
public struct Hobby {
    
    /// 名称
    public var name: String
    
    /// 类型
    public var type: String
    
    public init(name: String, type: String) {
        self.name = name
        self.type = type
    }
}

// MARK: - PersonProtocol
public protocol PersonProtocol {
    func isTeenager() -> Bool
    func hasHobbies() -> Bool
    associatedtype HumanFoods
    associatedtype HumanDrinks
    func eat(something foods: HumanFoods) throws -> Void
    func drink(something drinks: HumanDrinks) throws -> Void
}

extension PersonProtocol {
    func isTeenager() -> Bool {return false}
    func hasHobbies() -> Bool {return false}
    func eat(something foods: HumanFoods) throws -> Void {fatalError("Optional")}
    func drink(something drinks: HumanDrinks) throws -> Void {fatalError("Optional")}
}

// MARK: - Person2

public enum PersonError: Error {
    case ageError(_ message: String?)
    case eatError(_ message: String?)
    case drinkError(_ message: String?)
}

public enum Foods {
    public enum SomeFoods {
        case fruit(_ name: String)
        case vegetable(_ name: String)
        case stapleFood(_ name: String)
    }
    
    public enum SomeDrinks {
        case juice(_ name: String)
        case milk(_ name: String)
        case tea(_ name: String)
        case wine(_ name: String)
    }
}

public struct Person2 {
    public var name: String
    public var sex: Sex
    public var age: UInt8
    public var nationality: Nationality
    public var hobbies: [Hobby]?
    
    public init(name: String, sex: Sex, age: UInt8, nationality: Nationality, hobbies: [Hobby]? = nil) throws {
        if age > 150 {
            throw PersonError.ageError("The age is unbelievable!!")
        }
        self.name = name
        self.sex = sex
        self.age = age
        self.nationality = nationality
        self.hobbies = hobbies
    }
}

extension Person2: CustomStringConvertible {
    public var description: String {
        var myHobbies: String {
            guard let someHobbies = self.hobbies else {
                return "I have no hobby yet."
            }
            let hobbyStr = someHobbies.map({$0.name}).reduce("", {
                return $0 == "" ? $1 : $0 + "," + $1
            })
            return "I like \(hobbyStr)"
            
        }
        let content: String = """
        My name is \(self.name), \(self.sex), \(self.age) years old, and I'm a \(self.nationality).\n\(myHobbies)
        """
//        print(content)
        return content
    }
}

extension Person2: PersonProtocol {
    public typealias HumanFoods = Foods.SomeFoods
    
    public typealias HumanDrinks = Foods.SomeDrinks
    
    public func isTeenager() -> Bool {
        switch self.age {
        case 13...19 :
            return true
        default:
            return false
        }
    }
    
    public func hasHobbies() -> Bool {
        return false
    }
    
    public func eat(something foods: HumanFoods) throws -> Void {
        print("Eat \(foods)")
    }
    
    public func drink(something drinks: HumanDrinks) throws -> Void {
        switch drinks {
        case .wine(let name):
            if self.age < 18 {
                print("I am too young to drink wine.")
                throw PersonError.drinkError("Too young to drink.")
            }
            print("Drink some \(name) wine.")
            break
        case .juice(let name):
            print("Drink some \(name) juice.")
            break
        case .milk(let name):
            print("Drink some \(name) milk.")
            break
        case .tea(let name):
            print("Drink some \(name) tea.")
            break
        }
    }
}
