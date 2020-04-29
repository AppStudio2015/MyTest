//
//  ViewController.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    
    private lazy var homeNaviController: UINavigationController = {
        let viewController = HomeViewController()
        viewController.title = "Home"
        self.setTabBarItem(&viewController.tabBarItem, title: "Home", selectedImageName: "", normalImageName: "")
        let naviController = UINavigationController.init(rootViewController: viewController)
        naviController.navigationBar.barTintColor = UIColor.blue
        naviController.navigationBar.topItem?.title = "Home"
        naviController.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        
        return naviController
    }()
    
    private lazy var userNaviController: UINavigationController = {
        let viewController = UserViewController()
        viewController.title = "User"
        self.setTabBarItem(&viewController.tabBarItem, title: "User", selectedImageName: "", normalImageName: "")
        let naviController = UINavigationController.init(rootViewController: viewController)
        naviController.navigationBar.topItem?.title = "User"
        
        return naviController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setTabBarTheme()
        self.setTabBarItemThemeWith(color: UIColor.black, selectedColor: UIColor.blue)

        self.createViewControllers()
    }
}

extension ViewController {
    
    fileprivate func createViewControllers() -> Void {
        
        self.viewControllers = [self.homeNaviController, self.userNaviController]
    }
    
    fileprivate func setTabBarItem(_ tabBarItem: inout UITabBarItem, title: String, selectedImageName: String,  normalImageName: String) -> Void {
        let selectedTabBarImage: UIImage? = UIImage.init(named: selectedImageName)
        selectedTabBarImage?.withRenderingMode(.alwaysOriginal)
        let normalTabBarImage: UIImage? = UIImage.init(named: normalImageName)
        normalTabBarImage?.withRenderingMode(.alwaysOriginal)

        tabBarItem = UITabBarItem.init(title: title, image: normalTabBarImage, selectedImage: selectedTabBarImage)
    }
    
    fileprivate func setTabBarItemThemeWith(color normalColor: UIColor, selectedColor: UIColor) -> Void {
        
        let normalAttributes: [NSAttributedString.Key : Any] = [.foregroundColor:normalColor, .font: UIFont.regularFont18()]
        let selectedAttributes: [NSAttributedString.Key : Any] = [.foregroundColor:selectedColor, .font: UIFont.regularFont18()]
        UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    
    fileprivate func setTabBarTheme() -> Void {
            
            //去掉UITabBarController上面的黑色线条
    //        self.tabBar.barStyle = UIBarStyle.black

            //设置UITabBarController的颜色
            self.tabBar.isTranslucent = false
    //        self.tabBar.tintColor = UIColor.white
    //        UITabBar.appearance().tintColor = UIColor.black

            //设置阴影
            self.tabBar.layer.shadowColor = UIColor.lightGray.cgColor
            self.tabBar.layer.shadowOffset = CGSize.init(width: 0, height: -1)
            self.tabBar.layer.shadowOpacity = 0.3
        }
}

