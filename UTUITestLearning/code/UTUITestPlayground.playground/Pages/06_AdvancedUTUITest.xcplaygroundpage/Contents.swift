//: [Previous](@previous)
/*:
 ## 单元及UI测试进阶

 ### 私有函数测试
 
   * ObjeC
     - 创建分类
 
     ```objc
     #import "SomeClassHeader.h"

     @interface SomeClass (UnitTest)

     - (NSString * _Nullable)privateFuncWithParameter:(NSString * _Nullable)parameter;

     @end
 
     ```
 
     - 参考 `项目工程中` -> `UTUITestLearningTests` -> `SignupModelTests.m`
 
   * Swift
     - @testable
 
     在主工程的`Target`的`Build Settings`中将`Enable Testability`设置为`YES`
 
     > @testable provides access only for “internal” functions; “private” declarations are not visible outside of their file even when using @testable.
 
     ```swift
 
     @testable import SomeModule
 
     ```
 
     - 参考 `项目工程中` -> `UTUITestLearningTests` -> `UTUITestLearningTests`
 ---
 
 ### 异步测试（回调或Block）
   * XCTestExpectation && XCTWaiter
 
   ```swift
     func testDownloadWebData() {
         
         // Create an expectation for a background download task.
         let expectation = XCTestExpectation(description: "Download apple.com home page")
         
         // Create a URL for a web page to be downloaded.
         let url = URL(string: "https://apple.com")!
         
         // Create a background task to download the web page.
         let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
             
             // Make sure we downloaded some data.
             XCTAssertNotNil(data, "No data was downloaded.")
             
             // Fulfill the expectation to indicate that the background task has finished successfully.
             expectation.fulfill()
             
         }
         
         // Start the download task.
         dataTask.resume()
         
         // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
         wait(for: [expectation], timeout: 10.0)
     }
   ```
 
   * 参考 `项目工程中` -> `UTUITestLearningTests` -> `UserSigninModelTests`
 
 ---
 
 ### Mock
   * OCMock
   * Dobby, MockFive, SwiftMock
 
 ---
 
 ### XCTest高级功能
   * Record UI Test（录制UI测试）
 
     录制方式（**只支持UITest**）可极大简化写测试的流程，打开录制方式后，只要按一定流程操作手机或模拟器即可，XCTest会根据操作顺序自动填写测试代码。
 
     - 打开`UITest`工程，首先命名测试方法，将`光标`放置到函数体中，然后选择`录制按钮`，启动手机或模拟器，开始进行操作并录制。
     
     ![XTestRecord01](XCTestRecord01.png)
 
     - 操作完成后，再次点击`录制按钮`，完成录制，测试代码会自动填写到事先命名好的测试方法中。
     
     ![XTestRecord02](XCTestRecord02.png)
 
     - 再次点击 测试函数前的`▶️`按钮，就可以直接运行测试代码了
 
     > * 使用录制功能时，自动生成的代码可能会存在问题，比如按钮多次点击等等，在录制完成后，需要手动优化代码。
     > * 在使用录制功能时，如果发现`录制按钮`不可点击，可先写一行测试代码，然后就可以进行录制了。
 
   * Performance Test（性能测试）
 
   * Test Plan（测试计划）
 
   * Random And Parallel Tests
   ```
     xcodebuild test-without-building -workspace UTUITestLearning.xcworkspace\
        -scheme UTUITestLearningUITests\
        -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=13.4.1'\
        -destination 'platform=iOS Simulator,name=iPhone 8'\
        -only-testing:UTUITestLearningUITests/UTUITestLearningUITests
   ```
 
 ---
 
 ### 命令行方式
   1. Build and run unit test
 
   ```
     xcodebuild test [-workspace <your_workspace_name>]
                     [-project <your_project_name>]
                     -scheme <your_scheme_name>
                     -destination <destination-specifier>
                     [-only-testing:<test-identifier>]
                     [-skip-testing:<test-identifier>]
   ```
 
   2. Build unit tests without running or run unit tests without building
 
   ```
     # Build unit tests without running
     xcodebuild build-for-testing [-workspace <your_workspace_name>]
                                  [-project <your_project_name>]
                                  -scheme <your_scheme_name>
                                  -destination <destination-specifier>
 
     # run unit tests without building
     xcodebuild test-without-building [-workspace <your_workspace_name>]
                                      [-project <your_project_name>]
                                      -scheme <your_scheme_name>
                                      -destination <destination-specifier>
                                      [-only-testing:<test-identifier>]
                                      [-skip-testing:<test-identifier>]
 
     # run unit tests without building
     xcodebuild test-without-building -xctestrun <your_xctestrun_name>.xctestrun
                                      -destination <destination-specifier>
                                      [-only-testing:<test-identifier>]
                                      [-skip-testing:<test-identifier>]

   ```
 
   3. Smaples
 
   ```
    # Tests the iOS scheme on a device identified by 965058a1c30d845d0dcec81cd6b908650a0d701c.
    $ xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,id=965058a1c30d845d0dcec81cd6b908650a0d701c'
   
    # Do not test iOSAppUITests on an iPhone.
    $ xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,name=iPhone' -skip-testing:iOSAppUITests
   
    # Only testing SecondTestClass' testExampleB in the iOSAppTests unit test.
    $ xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,name=iPhone' -only-testing:iOSAppTests/SecondTestClass/testExampleB
   ```
 
   4. Operations
   ```
     # Build and Run Unit Test on Simulator Device
     $ xcodebuild test -workspace UTUITestLearning.xcworkspace -scheme UTUITestLearningTests -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=13.4.1' -only-testing:UTUITestLearningTests/UTUITestLearningTests/testExample
 
     # Build and Run UI Test on Simulator Device
     $ xcodebuild test -workspace UTUITestLearning.xcworkspace -scheme UTUITestLearningUITests -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=13.4.1' -only-testing:UTUITestLearningUITests/UTUITestLearningUITests/test01EnterRegisterView
 
     # Run UT Test on Simulator Device without Building
     $ xcodebuild test-without-building -workspace UTUITestLearning.xcworkspace -scheme UTUITestLearningUITests -destination 'platform=iOS Simulator,name=iPhone 11 Pro,OS=13.4.1' -only-testing:UTUITestLearningUITests/UTUITestLearningUITests/test01EnterRegisterView
   ```
 
 ---
 
 ### 参考
   * [Testing Tips & Tricks 2018](https://developer.apple.com/videos/play/wwdc2018/417/)
   * [Advanced Testing and Continuous Integration 2016](https://developer.apple.com/videos/play/wwdc2016/409)
   * [Adding Unit Tests to your Existing Project](https://developer.apple.com/documentation/xcode/adding_unit_tests_to_your_existing_project)
   * [Testing Asynchronous Operations with Expectations](https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations)
   * [Xcode Test Plans](https://useyourloaf.com/blog/xcode-test-plans/)
   * [Random And Parallel Tests](https://useyourloaf.com/blog/xcode-10-random-and-parallel-tests/)
   * [How do I run unit tests from the command line](https://developer.apple.com/library/archive/technotes/tn2339/_index.html)
   * [Snapshot Testing](https://www.objc.io/issues/15-testing/snapshot-testing/)
   * [objc.io - Testing](https://www.objc.io/issues/15-testing/)
   * [Testing with RxBlocking](http://rx-marin.com/post/rxblocking-part1/)
 */


//: [Next](@next)
