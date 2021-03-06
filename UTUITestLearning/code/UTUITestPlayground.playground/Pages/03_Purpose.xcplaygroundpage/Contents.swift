//: [Previous](@previous)
/*:
## 单元及UI测试意义及目的
 
 ### 测试驱动开发
   * 概念
 
   `TDD(Test-driven dev)`，基本思想就是在开发功能代码之前，先编写测试代码。也就是说在明确要开发某个功能后，首先思考如何对这个功能进行测试，并完成相应的测试用例，然后编写相关代码满足这些测试，然后循环添加这些功能，直至开发结束。
 
   * 特点
     * TDD侧重点偏向开发，开发完成即完工。传统的编码方式很难知道什么时候编码结束了，TDD模式下开发人员可以明确自己的编码工作已经结束了。
     * 代码大部分保持在高质量状态。
     * 减少文档和代码之间的差别。
     * 更适配单元测试
 
   * 遵循原则
 
     TDD一般遵循 `red->green->refactor` 的步骤，即（`报错->通过->重构`），因为是先写了测试代码，而还未添加产品代码，所以编译器会给出红色报警，当把相应的产品代码添加完善后，并让单元测试用例通过测试，通过的状态为绿色，如此反复直到各种边界和测试都进行完毕，此时我们就可以得到一个稳定的产品，所以可以大胆的对产品代码进行重构，只要保证项目最后是绿色状态，就说嘛重构的代码没问题。
  
 
 ---
 
 ### 行为驱动开发
   * 概念
 
   `BDD(Behavior-driven dev)`，是一种敏捷软件开发的技术，BDD的重点是通过与利益相关者的讨论取得对预期的软件行为的清醒认识。它通过用自然语言书写非程序员可读的测试用例扩展了测试驱动开发方法。
 
   * 特点
     * BDD更加侧重设计。
     * 测试代码是否符合客户的需求，侧重于代码的功能逻辑。
     * 避免客户和开发者在沟通上的障碍，实现客户和开发者同时定义系统的需求。
     * 更适配UI测试。
 
   * 遵循原则
 
     BDD提倡使用Given...When...Then 这种类似自然语言的描述来编写测试代码。
 
 ---
 
 ### 测试内容
   * 核心功能︰模型类和方法及其与控制器的交互
   * 最常见的用户界面工作流
   * 边界条件
   * 错误修复
 
 ---
 
 ### 测试的目的
   * 对于产品或项目？
     减少BUG，提高软件的质量或稳定性。
   * 对于开发者？
     一个任务？一种测试技能？
 
 ### 参考
   * [Engineering for Testability 2017](https://developer.apple.com/videos/play/wwdc2017/414)
   * [swift单元测试](https://blog.csdn.net/lin1109221208/java/article/details/91946838)
 
*/

//: Demo1 演示 TDD(测试驱动开发)

// case 1
let tim = Person1(name: "Tim", sex: "male", age: 8, nationality: "American")
tim.description()

// case 2
//let lina = Person1(name: "LinNa", sex: "female", age: 23, nationality: "American", hobbies: nil)
//lina.description()

// case 3
//let xiaoMing = Person1(name: "ZhangXiaoMing", sex: "Male", age: -1, nationality: "Other")
//xiaoMing.description()

// case 4
//tim.drink(something: "Milk")
//tim.drink(something: "Vodka")

//: Demo2 演示TDD(测试驱动开发)
let hobbies: [Hobby] = [
    Hobby(name: "Running", type: "Sport"),
    Hobby(name: "Fitness", type: "Sport"),
    Hobby(name: "Singing", type: "Art")
]
let lilei = Person2(name: "LiLei", sex: .male, age: 8, nationality: .Chinese, hobbies:hobbies)
//print(lilei.description)
//let lilei = Person2(name: "LiLei", sex: .male, age: 160, nationality: .Chinese)
lilei.drink(something: .juice("Orange"))
lilei.drink(something: .wine("Vodka"))
//
//let hanMeimei = Person2(name: "HamMeimei", sex: .female, age: 30, nationality: .Multi([.Japanese,.Thailand]))

//: [Next](@next)
