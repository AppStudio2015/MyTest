//: [Previous](@previous)
/*:
 ## 单元及UI测试进阶
 
 ### XCTest高级功能
   * Record UI Test（录制UI测试）
   * TestPlan（测试计划）
 
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
 
   2. Run unit test without building
 
   ```
     xcodebuild build-for-testing [-workspace <your_workspace_name>]
                                  [-project <your_project_name>]
                                  -scheme <your_scheme_name>
                                  -destination <destination-specifier>

   ```
 
   3. Smaples
 
   ```
       $ xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,id=965058a1c30d845d0dcec81cd6b908650a0d701c'
   
       $ xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,name=iPhone' -skip-testing:iOSAppUITests
   
       $ xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,name=iPhone' -only-testing:iOSAppTests/SecondTestClass/testExampleB
   ```
 
 ---

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
 
 ### 参考
   * [Testing Tips & Tricks 2018](https://developer.apple.com/videos/play/wwdc2018/417/)
   * [Advanced Testing and Continuous Integration 2016](https://developer.apple.com/videos/play/wwdc2016/409)
   * [Adding Unit Tests to your Existing Project](https://developer.apple.com/documentation/xcode/adding_unit_tests_to_your_existing_project)
   * [Testing Asynchronous Operations with Expectations](https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations)
   * [How do I run unit tests from the command line](https://developer.apple.com/library/archive/technotes/tn2339/_index.html)
 */


//: [Next](@next)
