//
//  LoginViewController.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

/// 登录视图控制器
class SigninViewController: UIViewController {
    
    /// 登录视图
    fileprivate lazy var signinView: SigninView = {
        let view = SigninView.init(frame: self.view.bounds)
        view.delegate = self
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = self.signinView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: - SiginViewDelegate
extension SigninViewController : SiginViewDelegate {
    
    func siginViewDidClickSignin(_ signinView: SigninView) {
        self.dismiss(animated: true) {
            // Finished
        }
    }
    
    func siginViewDidClickRegister(_ signinView: SigninView) {
        let viewController = RegisterViewController()
        self.present(viewController, animated: true) {
            // Finished
        }
    }
}
