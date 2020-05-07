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
 
   * Swift
     - @testable
     在主工程的`Target`的`Build Settings`中把`Enable Testability`设置为`YES`
     > @testable provides access only for “internal” functions; “private” declarations are not visible outside of their file even when using @testable.
 
     ```swift
 
     @testable import SomeModule
 
     ```
 
 ---
 
 ### 回调函数(代理函数)测试
 
 ---
 
 ### Mock
   * OCMock
   * Dobby,MockFive, SwiftMock
 
 ---
 
 ### XCTest高级功能
   * Record UI Test（录制UI测试）
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
 */


//: [Next](@next)
