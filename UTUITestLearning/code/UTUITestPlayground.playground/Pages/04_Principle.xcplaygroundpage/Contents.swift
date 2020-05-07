//: [Previous](@previous)
/*:
  ## 单元及UI测试原则
 
 ### FIRST原则（简要描述了有效的单元测试需要什么条件）
   这些条件包括：

   * Fast：测试的运行速度要快，这样人们就不介意你运行它们了。
   * Independent/Isolated：一个测试不应当依赖于另一个测试。
   * Repeatable：同一个测试，每次都应当获得相同的结果。外部数据提供者和并发问题会导致间歇性的出错。
   * Self-validating：测试应当是完全自动化的，输出结果要么是 pass 要么是 fail，而不是依靠程序员对日志文件的解释。
   * Timely：理想情况下，测试的编写，应当在编写要测试的产品代码之前。
 
   遵循 FIRST 原则会让你的测试清晰和有用。
 
 ### 3R（Responsible, Reliable, Repeative）原则
 
   * Responsible: 谁开发谁负责测试，在哪里开发就在哪里测试。
   > 开发在完成一个方法，或者一个类之后，就要及时得进行单元测试；不能在对应方法或类的调用处进行测试，比如两个模块A、B，A是基础模块，为模块B提供服务，那么所有A模块的单元测试case都应该在A模块的内部进行测试。
 
   * Reliable: 测试case要可靠，并且是值得信赖的，对于底层的任何改动都要能够及时感知。
   > 为了使得测试用例尽量可靠，就要减少mock的使用（对于第三方的调用可以使用mock），对每层代码的测试都要完全依赖于下层，不能mock下层逻辑。因此引入递进集成的概念，比如测试DAO时要连接真实的数据库，测试Service时要使用真实的DAO、DB， 测试Controller层的代码，要使用真实的Service、DAO、DB，以此类推。这样就可以最大限度的提高case的可靠性。
 
   * Repeative: 所有单元测试用例都要能够重复运行。能够重复运行就能够进行回归测试、覆盖率统计等等。
   > 必须要做到case间完全解耦，没有任何的依赖，这包括和数据库的依赖以及第三方的依赖。case解耦可以通过准备测试数据、mock第三方调用来解决。
 
 ---
 
 ### 测试用例（Test Case）设计方法
   * 等价类划分法: 将测试的范围划分成几个互不相交的子集，他们的并集是全集，从每个子集选出若干个有代表性的值作为测试用例。
   * 边界值分析法: 针对各种边界情况设计测试用例，可以查出更多的错误。
   * 错误推测: 根据经验或直觉推测程序中可能存在的各种错误，从而有针对性地编写检查这些错误的测试用例的方法。
   * 判定表法: 又称为策略表，基于策略表的测试，是功能测试中最严密的测试方法。该方法适合于逻辑判断复杂的场景，通过穷举条件获得结果，对结果再进行优化合并，会得到一个判断清晰的策略表。 
 
 ---
 ### iOS的单元或UI测试经验性原则
   * 开发人员应侧重于单元测试（TDD）。
   * 视图或视图控制器侧重于UI测试。
   * 模型（Model）、管理器（Manager）或Framework等侧重于单元测试。
   * 测试的代码覆盖率达到 60~80% 即可。
   * 请不要把 `测试` 当成的 `任务` ！！ 。
 
 ---
 ### 参考
   * [51testing](http://www.51testing.com/html/index.html)
   * [单元测试设计原则](https://blog.csdn.net/heymysweetheart/article/details/51836868?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-1)
   * [测试用例的几种常见设计方法](https://blog.csdn.net/guohao_zhang/article/details/80610561)
 */

//: [Next](@next)
