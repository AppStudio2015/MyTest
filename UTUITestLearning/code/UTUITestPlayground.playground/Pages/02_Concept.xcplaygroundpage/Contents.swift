//: [Previous](@previous)
/*:
 ## 单元及UI测试概念简单说明
 
 ### 单元测试(Uint Test)
 * 概念
   是指对软件中的最小可测试单元进行检查和验证。
 
 
 ### UI测试(User Interface Test)
 * 概念
   测试用户界面的功能模块的布局是否合理，整体风格是否一致和各个控件的放置位置是否符合客户使用习惯，
   更重要的是要符合操作便捷，导航简单易懂，界面中文字是否正确，命名是否统一，页面是否美观，文字、图片组合是否完美等等。
 
 ### 测试用例(Test Case)
  * [概念](https://baike.baidu.com/item/测试用例):测试用例(Test Case)是指对一项特定的软件产品进行测试任务的描述，体现测试方案、方法、技术和策略。
 
 ### UT(Uint Test), IT(Integration Test), ST(System Test)
   * 概念
     - [UT(单元测试)](https://baike.baidu.com/item/单元测试):
     - [IT(集成测试)](https://baike.baidu.com/item/集成测试):
     - [ST(系统测试)](https://baike.baidu.com/item/系统测试):
 
 ### WhiteTest, BlackTest, GrayTest
   * 概念
     - [WT白盒测试](https://baike.baidu.com/item/白盒测试/934440):又称结构测试、透明盒测试、逻辑驱动测试或基于代码的测试。
     - [BT黑盒测试](https://baike.baidu.com/item/黑盒测试/934030):也称功能测试，它是通过测试来检测每个功能是否都能正常使用。
     - [GT灰盒测试](https://baike.baidu.com/item/灰盒测试/1906276?fr=aladdin):是介于白盒测试与黑盒测试之间的一种测试。
 
 ### Mock和Stub函数
   * 概念
     - Mock: 在测试过程中，对于某些不容易构造或者不容易获取的对象，用一个虚拟的对象来创建以便测试的测试方法。
     - Stub: 在测试过程中，用来代替某些代码的代码,测试函数调用了一个未编写的函数，可以编写桩函数来代替该被调用的函数，桩代码也用于实现测试隔离。
 */
let 👨‍🎓: Person = Person(name: "Xiao ming", sex: "male", age: 28, hobbies: nil)
👨‍🎓.isTeenager()

/*:
 ### Code Coverage 代码覆盖率
   * 概念
     是软件测试中的一种度量，描述程序中源代码被测试的比例和程度，所得比例称为代码覆盖率。
 
   * C0~C4覆盖率
 
     - C0: 单元测试代码的时候，C0覆盖100的意思，即是要覆盖到所有的代码。
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
      - C1: 单元测试代码的时候，C1覆盖到每一个条件分支。
 
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
     - C2,C3: 单元测试代码的时候，每个if判断中的条件的真/假都要覆盖。
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
     - C4: 单元测试代码的时候，覆盖到每种可能的路径。
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
   * 概念 : Apple提供的`测试框架`，可以使用`XCODE`来创建并运行单元测试，性能测试和UI测试。
 
   * 单元及UI测试框架说明
     + XCTestCase: The primary class for defining test cases, test methods, and performance tests.
 
     + Unit Test
 
     + UI Test
       - XCUIApplication: A proxy for an application that can be launched and terminated.
       - XCUIElementQuery: A query for locating UI elements.
       - XCUIElement: A UI element in an application.
        > On macOS, XCUIElement provides keyboard- and mouse-like interactions such as typing, hovering, clicking, and scrolling. On iOS, XCUIElement provides gestural interactions such as tapping, pressing, swiping, pinching, and rotating.
     
     + Test Assertions
       - Boolean Assertions
       - Nil and Non-nil Assertions
       - Equality and Inequality Assertions
       - Comparable Value Assertions
       - Error Assertions
       - Failing Unconditionally
 
 
    * 测试步骤
 
      Add tests to your Xcode project by writing one or more test methods, each of which verifies a specific aspect of your code. Group related test methods into test cases, each of which is a subclass of XCTestCase.
      - To add tests to your project:
      - Create a new subclass of XCTestCase within a test target.
      - Add one or more test methods to the test case.
      - Add one or more test assertions to each test method.
 
   * Unit Test 代码结构
 
  ```
         import XCTest
         @testable import UTUITestLearning

         class UTUITestLearningTests: XCTestCase {

             override func setUpWithError() throws {
                 // Put setup code here. This method is called before the invocation of each test method in the class.
             }

             override func tearDownWithError() throws {
                 // Put teardown code here. This method is called after the invocation of each test method in the class.
             }

             func testExample() throws {
                 // This is an example of a functional test case.
                 // Use XCTAssert and related functions to verify your tests produce the correct results.
             }

             func testPerformanceExample() throws {
                 // This is an example of a performance test case.
                 self.measure {
                     // Put the code you want to measure the time of here.
                 }
             }

         }
   ```
 
   * UI Test 代码结构
 
   ```
        import XCTest

        class UTUITestLearningUITests: XCTestCase {

           override func setUpWithError() throws {
               // Put setup code here. This method is called before the invocation of each test method in the class.

               // In UI tests it is usually best to stop immediately when a failure occurs.
               continueAfterFailure = false

               // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
           }

           override func tearDownWithError() throws {
               // Put teardown code here. This method is called after the invocation of each test method in the class.
           }

           func testExample() throws {
               // UI tests must launch the application that they test.
               let app = XCUIApplication()
               app.launch()

               // Use recording to get started writing UI tests.
               // Use XCTAssert and related functions to verify your tests produce the correct results.
           }

           func testLaunchPerformance() throws {
               if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
                   // This measures how long it takes to launch your application.
                   measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                       XCUIApplication().launch()
                   }
               }
           }
        }
   ```
 
   * 编写及命名
     > Test case and test method names are used in Xcode’s test navigator and integration reports to group and identify tests.
     To help clarify the organization of your tests, give each test case a name that summarizes the tests within it, such as TableValidationTests, NetworkReachabilityTests, or JSONParsingTests.
     To help identify failing tests, give each test method a name that makes it clear what is tested by that method, such as testEmptyTableRowAndColumnCount(), testUnreachableURLAccessThrowsAnError(), or testUserJSONFeedParsing().
     
     > 测试函数的排序规则是按`数字、字母`顺序进行排序，如果想按理想顺序执行，可以考虑在命名时添加相应的`数字或字母`，如
     ```
     func test01UserJSONFeedParsing(){...}
 
     func test02UnreachableURLAccessThrowsAnError(){..}
     ```
 
   * 执行测试
     1. 执行测试方法
       - 在测试代码中，在每个`测试方法`前点击`▶️`执行。
       - 在`Show the Test navigator`中，点击每个`测试方法`后面的`▶️`执行。
       ![XCTestExecute00](XCTestExecute00.png)
 
     2. 执行多个测试方法
       - 在测试代码中，在每个`测试类`前点击`▶️`执行。
       - 在`Show the Test navigator`中，点击每个`测试类`后面的`▶️`执行。
       ![XCTestExecute00](XCTestExecute01.png)
 
   * 查看结果
     1. 在`Show the Test navigator`中查看。
 
     ![XCTestResult00](XCTestResult00.png)
 
     2. 在`Show the Report navigator`中查看。
 
     ![XCTestResult01](XCTestResult01.png)
 
 ---
 ### 参考
   * [XCTest](https://developer.apple.com/documentation/xctest)
   * [Testing in Xcode 2019](https://developer.apple.com/videos/play/wwdc2019/413/)
   * [What's New in Testing 2018](https://developer.apple.com/videos/play/wwdc2018/403)
   * [UI Testing in Xcode 2015](https://developer.apple.com/videos/play/wwdc2015/406)
 
 */

//: [Next](@next)
