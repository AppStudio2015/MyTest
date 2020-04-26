//: [Previous](@previous)
/*:
  ## 单元及UI测试原则
 
 ### FIRST原则（几个单词的缩写，简要描述了有效的单元测试需要什么条件）
 这些条件包括：

 * Fast：测试的运行速度要快，这样人们就不介意你运行它们了。
 * Independent/Isolated：一个测试不应当依赖于另一个测试。
 * Repeatable：同一个测试，每次都应当获得相同的结果。外部数据提供者和并发问题会导致间歇性的出错。
 * Self-validating：测试应当是完全自动化的，输出结果要么是 pass 要么是 fail，而不是依靠程序员对日志文件的解释。
 * Timely：理想情况下，测试的编写，应当在编写要测试的产品代码之前。
 
 遵循 FIRST 原则会让你的测试清晰和有用。
 
 ### 量化原则
 * 代码覆盖率
 * 缺陷比率
 * 其它
 
 */

import Foundation

var str = "Hello, playground"

//: [Next](@next)