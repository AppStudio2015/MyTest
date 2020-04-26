//: [Previous](@previous)
/*:
 ## 单元及UI测试概念简单说明
 
 ### 单元测试(Uint Test)
 * 概念
   是指对软件中的最小可测试单元进行检查和验证
 
 
 ### UI测试(User Interface Test)
 * 概念
   测试用户界面的功能模块的布局是否合理，整体风格是否一致和各个控件的放置位置是否符合客户使用习惯，
   更重要的是要符合操作便捷，导航简单易懂，界面中文字是否正确，命名是否统一，页面是否美观，文字、图片组合是否完美等等。
 
 
 ### Mock和Stub函数
 * 概念
 1. Mock: 在测试过程中，对于某些不容易构造或者不容易获取的对象，用一个虚拟的对象来创建以便测试的测试方法。
 2. Stub: 在测试过程中，用来代替某些代码的代码,测试函数调用了一个未编写的函数，可以编写桩函数来代替该被调用的函数，桩代码也用于实现测试隔离。
 */
let xiaoMing: Person = Person(name: "Xiao ming", sex: .male, age: 28, hobbies: nil)

 /*:
 ### Code Coverage 代码覆盖率
 * 概念
   是软件测试中的一种度量，描述程序中源代码被测试的比例和程度，所得比例称为代码覆盖率。
 
 * C0~C4覆盖率
 1. C0: 单元测试代码的时候，C0覆盖100的意思，即是要覆盖到所有的代码。
 */

func testC0() -> Int {
    let a = 0
    var b = a + 1
    var c = b + 1
    var result = c + 1
    return result
}

// Test C0
testC0()

/*:
 2. C1: 单元测试代码的进修，C1覆盖到每一个条件分支。
 
*/

func testC1(_ condition: Int) -> Void {
    if condition == 2 {
        print("Execute C1 cmd 1.")
    } else {
        print("Execute C1 cmd 2.")
    }
}

// Test C1
testC1(2)
testC1(3)

/*:
 3. C2,C3: 单元测试代码的进修，每个if判断中的条件的真/假都要覆盖。
 */

func testC2C3(x: Int, y: Int) -> Int {
    if x == 5, y == 6 {
        print("Execute C2C3 cmd 1")
    } else {
        print("Execute C2C3 cmd 2")
    }
}

// Test C2C3
testC2C3(x: 5, y: 6)
testC2C3(x: 6, y: 6)
testC2C3(x: 5, y: 5)
testC2C3(x: 7, y: 7)

/*:
 3. C4: 单元测试代码的进修，覆盖到每种可能的路径。
 */

func testC4(a: Bool, b: Bool) -> Void {
    if a {
        print("Execute C4 cmd 1")
    } else {
        print("Execute C4 cmd a")
    }
    
    if b {
        print("Execute C4 cmd 2")
    } else {
        print("Execute C4 cmd b")
    }
}

testC4(a: true, b: true)
testC4(a: true, b: false)
testC4(a: false, b: true)
testC4(a: false, b: false)

/*:
 ### XCTest
 
 ### 参考
 * [Testing in Xcode 2019](https://developer.apple.com/videos/play/wwdc2019/413/)
 * [What's New in Testing 2018](https://developer.apple.com/videos/play/wwdc2018/403)
 * [Engineering for Testability 2017](https://developer.apple.com/videos/play/wwdc2017/414)
 * [UI Testing in Xcode 2015](https://developer.apple.com/videos/play/wwdc2015/406)
 */

//: [Next](@next)
