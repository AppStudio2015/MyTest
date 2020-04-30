//
//  UserViewController.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/27.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

/// 用户视图控制器
class UserViewController: BaseViewController {
    /// 用户视图
    fileprivate lazy var userView: UserView = {
        let view: UserView = UserView.init(frame: self.view.bounds)
        view.delegate = self
        return view
    }()
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.view = self.userView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension UserViewController {
    
    /// Push 视图控制器
    /// - Parameters:
    ///   - viewController: 视图控制器
    ///   - animated: 是否有动效
    ///   - bottomBarIsHidden: 底部栏是否隐藏，默认： `True`
    func pushViewController(_ viewController: UIViewController, animated: Bool, bottomBarIsHidden: Bool = true) {
        guard let rootViewController = self.navigationController else {
            return
        }
        viewController.hidesBottomBarWhenPushed = bottomBarIsHidden
        rootViewController.pushViewController(viewController, animated: animated)
    }
    
    /// Present 视图控制器
    /// - Parameters:
    ///   - viewController: 视图控制器
    ///   - animated: 是否有动效
    ///   - modalStyle: 模态类型，默认：`FullScreen`
    func presentViewController(_ viewController: UIViewController, animated: Bool, modalStyle: UIModalPresentationStyle = .fullScreen) {
        viewController.modalPresentationStyle = modalStyle
        self.present(viewController, animated: animated, completion: nil)
    }
}

// MARK: - UserViewDelegate

extension UserViewController: UserViewDelegate {
    func userViewDidClickAvatar(_ view: UserView) {
        let viewController: SigninViewController = SigninViewController()
        viewController.title = "Signin"
        self.presentViewController(SigninViewController(), animated: true, modalStyle: .pageSheet)
    }
    
    func userView(_ view: UserView, didSelectSettingItemAt index: Int) {
        let viewController: UserSettingViewController = UserSettingViewController()
        viewController.title = "Settings"
        viewController.view.backgroundColor = UIColor.white
        self.pushViewController(viewController, animated: true)
    }
}
