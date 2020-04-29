//
//  LoginView.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

// MARK: - SiginViewDelegate

/// 登录视图代理
protocol SiginViewDelegate: NSObjectProtocol {
    
    /// 登录按钮点击回调
    /// - Parameter signinView: 登录视图
    func siginViewDidClickSignin(_ signinView: SigninView)
    
    /// 注册按钮点击回调
    /// - Parameter signinView: 登录视图
    func siginViewDidClickRegister(_ signinView: SigninView)
}

// MARK: - SigninView

/// 登录视图
class SigninView: BaseView {
    
    /// 手机号输入框
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    /// 密码输入框
    @IBOutlet weak var passwordTextField: UITextField!
    
    /// 登录按钮
    @IBOutlet weak var signinButton: UIButton! {
        didSet {
            if oldValue == nil {
                signinButton.layer.cornerRadius = 6
                signinButton.layer.masksToBounds = true
                signinButton.addTarget(self, action: #selector(didClickSignButton(_:)), for: .touchUpInside)
            }
        }
    }
    
    /// 注册按钮
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            if oldValue == nil {
                registerButton.addTarget(self, action: #selector(didClickRegisterButton(_:)), for: .touchUpInside)
            }
        }
    }
    
    /// 代理
    public weak var delegate: SiginViewDelegate?

    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutNibView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layoutNibView()
    }
    
}

// MARK: - Target Actions

extension SigninView {
    
    /// 登录点击处理
    /// - Parameter button: 登录按钮
    @objc fileprivate func didClickSignButton(_ button: UIButton) {
        print("\(#function)")
        self.delegate?.siginViewDidClickSignin(self)
    }
    
    /// 注册点击处理
    /// - Parameter button: 注册按钮
    @objc fileprivate func didClickRegisterButton(_ button: UIButton) {
        print("\(#function)")
        self.delegate?.siginViewDidClickRegister(self)
    }
}
