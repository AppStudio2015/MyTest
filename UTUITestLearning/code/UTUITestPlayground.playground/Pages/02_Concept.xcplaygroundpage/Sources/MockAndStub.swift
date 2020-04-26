import Foundation

public enum Sex {
    case male
    case female
}

public struct Hobby {
    
}

public struct Person {
    public var name: String
    public var sex: Sex
    public var age: Int8
    public var hobbies: [Hobby]?
}

public extension Person {
    func isTeenager() -> Bool {
        switch self.age {
        case 13...19 :
            return true
        default:
            return false
        }
    }
    
    func hasHobbies() -> Bool {
        return false
    }
}
