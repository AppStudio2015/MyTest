import Foundation

public struct Hobby {
    
}

public struct Person {
    public var name: String
    public var sex: String
    public var age: Int8
    public var hobbies: [Hobby]?
    
    public init(name: String, sex: String, age: Int8, hobbies: [Hobby]? = nil) {
        self.name = name
        self.sex = sex
        self.age = age
        self.hobbies = hobbies
    }
}

public extension Person {
    func isTeenager() -> Bool {
        if self.age > 13, self.age < 19 {
            print("I am teenage.")
            return true
        }
        print("I am not teenage.")
        return false
    }
    
    func isMiddleSchoolStudent() -> Bool {
        if self.isTeenager() {
            return true
        }
        
        return false
    }
    
    func hasHobbies() -> Bool {
        return false
    }
    
    func eat(something foods: String) -> Void {
        print("Eat \(foods)")
    }
    
    func drink(something drinks: String) -> Void {
        print("Drink \(drinks)")
    }
}

fileprivate extension Person {
    
    func isAdult() -> Void {
        
    }
}
