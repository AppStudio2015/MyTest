//: [Previous](@previous)
/*:
 ## 创建单元及UI测试
 
 ### 创建原生单元及UI测试(XCTest)
 * 创建单元及UI测试
   1. 创建初始工程，选择 `Include Unit Tests` 和 `Include UI Tests`
   
   ![Creation01](Creation01.png)
 
   2. 工程目录结构包含了 `XXXTests` 和 `XXXUITests` 两个Target文件目录
   
   ![Creation02](Creation02.png)
 
 * 追加单元及UI测试Target
   1. 在**无单元或UI测试工程**中`追加`单元或UI测试
   
   ![AddXCTest01](XCTest01.png)
   
   2. 配置 `Team`,`Organization Name`,`Organization Identifier`
   
   ![AddXCTest02](XCTest02.png)
     > 如果是使用 **模拟器** 进行测试，上述 `Team`，`Organization Name`，`Organization Identifier` 可以简单设置；
     > 如果是使用 **真机** 进行测试，则需要配置相关的 **开发证书(.p12)及描述文件(.mobileprovision)**，否则将无法正常运行。
 
 * 配置单元及UI测试Target
     1. 创建或追加`单元和UI测试`后，`App Target` 及` 测试 Target` 结构如下：
     
     ![XCTest03](XCTest03.png)
 
     2. 添加单元及UI测试Scheme，**XCODE** ，选择`Target: 可执行App`，选择`Product` -> `Scheme` -> `New Scheme`
    
     ![XCTest04](XCTest04.png)
 
     3. 选择对应的单元或UI测试 `Target` 进行添加
    
     ![XCTest05](XCTest05.png)
 
     4. 检查`Schemes`，**XCODE** ，选择`Target: 可执行App`，选择`Product` -> `Scheme` -> `Manage Schemes`，会出现单元和UI测试的 `两个Scheme` 项目
   
     ![XCTest06](XCTest06.png)
 
     5. 配置单元或UI测试`Scheme`的`Run Action`，设置 **XCODE** ，选择`Target: xxxTests 或 xxxUITests`，选择 `Product` -> `Scheme` -> `Edit Scheme` -> `Run` -> `Info`
   
     选择 **Excutable** 代码覆盖率
   
     ![XCTest08](XCTest08.png)
   
     添加 **Target**，选择可执行文件
    
     ![XCTest09](XCTest09.png)
     ![XCTest10](XCTest10.png)
 
     > 如果没有配置`Run Action`，在执行单元或UI测试时会出现如下错误提示
     ![XCTest07](XCTest07.png)
 
---
 
 ### 执行 XCTest
 
   * Objecive-C 单元及UI测试
 
     参考 `UTUITestLearning` 项目中 `RegisterModelTests.m`
 
   * Swfit单元及UI测试
 
     参考 `UTUITestLearning` 项目中 `UTUITestLearningTests.swift`
 
   * 混编单元及UI测试
 
     参考 `UTUITestLearning` 项目
 
 ---
 
 ### 支持显示代码覆盖率
 
   * 设置显示代码覆盖率
     1. 设置 **XCODE** ，选择`Target: xxxTests 或 xxxUITests`，选择 `Product` -> `Scheme` -> `Edit Scheme` -> `Test` -> `Options`
     
     ![SetCodeCoverage](CodeCoverage01.png)
     
     2. 代码覆盖率结果
 
     ![CodeCoverage04](CodeCoverage04.png)
 
     3. 代码中显示覆盖情况
 
     ![CodeCoverage05](CodeCoverage05.png)
 
 ---
 

 ### 测试结果文件
   * 路径:
 
     /Users/{username}/Library/Developer/Xcode/DerivedData/UTUITestLearning-biextvvthrsptqeltatuqbjfovcl/Logs/Test

   * 文件:  <target>-<date>-+<number>.xcresult
 
   ![XCTestResult01](XCTestResult01.png)

   * <target>-<date>-+<number>.xcresult 内容：
 
   ![XCTestResult02](XCTestResult02.png)
 
 ---
 
 ### 参考
   * [Testing with Xcode](https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/01-introduction.html#//apple_ref/doc/uid/TP40014132-CH1-SW1)
   * [Testing Your Apps in Xcode](https://developer.apple.com/documentation/xcode/testing_your_apps_in_xcode)
*/

//: [Next](@next)
