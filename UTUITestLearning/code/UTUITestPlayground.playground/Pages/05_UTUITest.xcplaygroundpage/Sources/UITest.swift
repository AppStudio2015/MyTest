//: UI Test
import XCTest

let app = XCUIApplication()

// 启动应用
func launchApp() {
   app.launch()
}

/// 停止应用
func terminateApp() {
    app.terminate()
}

