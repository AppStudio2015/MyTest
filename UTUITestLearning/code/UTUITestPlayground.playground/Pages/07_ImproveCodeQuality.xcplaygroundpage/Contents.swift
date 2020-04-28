//: [Previous](@previous)
/*:
 ## 提高代码质量方法
 
 ### 编码规约
   * 规范团队成员编码行为，制定适合团队、项目的，相对灵活的编码规范
     1. Objective-C Style

       **OC Code Organization**

       Use `#pragma mark -` to categorize methods in functional groupings and protocol/delegate implementations following this general structure.

       ```objc
       #pragma mark - Lifecycle

       - (instancetype)init {}
       - (void)dealloc {}
       - (void)viewDidLoad {}
       - (void)viewWillAppear:(BOOL)animated {}
       - (void)didReceiveMemoryWarning {}

       #pragma mark - Custom Accessors

       - (void)setCustomProperty:(id)value {}
       - (id)customProperty {}

       #pragma mark - IBActions

       - (IBAction)submitData:(id)sender {}

       #pragma mark - Public

       - (void)publicMethod {}

       #pragma mark - Private

       - (void)privateMethod {}

       #pragma mark - Protocol conformance
       #pragma mark - UITextFieldDelegate
       #pragma mark - UITableViewDataSource
       #pragma mark - UITableViewDelegate

       #pragma mark - NSCopying

       - (id)copyWithZone:(NSZone *)zone {}

       #pragma mark - NSObject

       - (NSString *)description {}
       ```

     2. Swift Style

       **Swift Code Organization**

       Use extensions to organize your code into logical blocks of functionality. Each extension should be set off with a `// MARK: -` comment to keep things well-organized.

       **Protocol Conformance**

       In particular, when adding protocol conformance to a model, prefer adding a separate extension for the protocol methods. This keeps the related methods grouped together with the protocol and can simplify instructions to add a protocol to a class with its associated methods.

       **Preferred**:
       ```swift
       class MyViewController: UIViewController {
         // class stuff here
       }

       // MARK: - UITableViewDataSource
       extension MyViewController: UITableViewDataSource {
         // table view data source methods
       }

       // MARK: - UIScrollViewDelegate
       extension MyViewController: UIScrollViewDelegate {
         // scroll view delegate methods
       }
       ```

       **Not Preferred**:
       ```swift
       class MyViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
         // all methods
       }
       ```

       Since the compiler does not allow you to re-declare protocol conformance in a derived class, it is not always required to replicate the extension groups of the base class. This is especially true if the derived class is a terminal class and a small number of methods are being overridden. When to preserve the extension groups is left to the discretion of the author.

       For UIKit view controllers, consider grouping lifecycle, custom accessors, and IBAction in separate class extensions.
 
 ---
 
 ### 自定义模板
   * 编写适合团队、项目的，相对灵活的代码段、文件或工程模板库
   * XCTemplate
 
     ![Templates](Templates.png)
 
   * CodeSnippets
 
     ![CodeSnippets](CodeSnippets.png)
 
 ---
 
 ### Code Review
 
 ---
 
 ### 静态检查
   * 引入代码静态检查工具
     - Lint工具
     - 其它（Infer）
 
 ---
 
 ### 单元及UI测试
 
 ---
 
 ### 第三方代码质量管理工具
   * SonarQube
     简介：是一款用于代码质量管理的开源工具，它主要用于管理源代码的质量。当前流行的编程语文基本都支持，Sonar可以通过PMD,CheckStyle,Findbugs等等代码规则检测工具来检测你的代码，帮助你发现代码的漏洞，Bug，异味等信息。

 ![SonarQuber](SonarQube.png)
 
 ---
 
 ### 总结
   * 单元或UI测试对于开发者的意义
     - 培养良好的编程习惯。
     - 提升程序设计、架构、重构能力。
     - 编写可测试的程序（程序）！
     - 为了我们下一次更好更好的开发！
 
 ---
 
 ### 参考
   * [参考Raywenderlich](https://github.com/raywenderlich/swift-style-guide)
   * [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
   * [OCLint](http://oclint.org)
   * [SwiftLint](https://realm.github.io/SwiftLint)
   * [Sonar Qube](https://www.sonarqube.org)
   * [SonarQube 的用法](http://www.imooc.com/article/279446?block_id=tuijian_wz)
   * [自定义代码段和文件模板](http://www.cocoachina.com/articles/25182)
   * [自定义模板文件夹](https://blog.csdn.net/yanhaijunyan/article/details/102922079)
 */


//: [Next](@next)
