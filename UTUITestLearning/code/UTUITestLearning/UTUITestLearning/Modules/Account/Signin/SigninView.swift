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
    
    /// 登录按钮点击回调
    /// - Parameters:
    ///   - view: 登录视图
    ///   - phoneNubmer: 手机号
    ///   - password: 密码
    func siginView(_ view: SigninView, didClickSigninWith phoneNumber: String, password: String)
    
    /// 验证手机号是否有效
    /// - Parameters:
    ///   - view: 登录视图
    ///   - phoneNumber: 手机号
    ///   - isValid: 是否有效
    func siginView(_ view: SigninView, validatePhoneNumber phoneNumber: String, isValid: Bool)
    
    /// 验证密码是否有效
    /// - Parameters:
    ///   - view: 登录视图
    ///   - password: 密码
    ///   - isValid: 是否有效
    func siginView(_ view: SigninView, validatePassword password: String, isValid: Bool)
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
                signinButton.isEnabled = false
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
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    /// 代理
    public weak var delegate: SiginViewDelegate?
    
    /// 手机号
    fileprivate var phoneNumber: String?
    
    /// 密码
    fileprivate var password: String?

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

// MARK: - Private Methods

extension SigninView {
    
    fileprivate func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        let numberOfPhone: Int = phoneNumber.count
        if numberOfPhone == 11 {
            return true
        }
        self.delegate?.siginView(self, validatePhoneNumber: phoneNumber, isValid: false)
        return false
    }
    
    fileprivate func validatePassword(_ password: String) -> Bool {
        
        if password.count < 6 {
            self.delegate?.siginView(self, validatePassword: password, isValid: false)
            return false
        }
        return true
    }
}

// MARK: - Public Methods

extension SigninView {
    
    func startLoading() {
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }
}

// MARK: - Target Actions

extension SigninView {
    /// 登录点击处理
    /// - Parameter button: 登录按钮
    @objc fileprivate func didClickSignButton(_ button: UIButton) {
        print("\(#function)")
//        self.delegate?.siginViewDidClickSignin(self)
        guard let aPhoneNum = self.phoneNumber, let aPassword = self.password else {
            return
        }
        self.delegate?.siginView(self, didClickSigninWith: aPhoneNum, password: aPassword)
    }
    /// 注册点击处理
    /// - Parameter button: 注册按钮
    @objc fileprivate func didClickRegisterButton(_ button: UIButton) {
        print("\(#function)")
        self.delegate?.siginViewDidClickRegister(self)
    }
}

// MARK: - UITextFieldDelegate

extension SigninView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.phoneNumberTextField {
            guard let aPhoneNum = textField.text else {
                return
            }
            
            print("Phone Number:\(aPhoneNum)")
            
        } else if textField == self.passwordTextField {
            guard let aPassword = textField.text else {
                return
            }
            print("Password:\(aPassword)")
        }
        
//        self.signinButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.phoneNumberTextField {
            self.phoneNumberTextField.resignFirstResponder()
        } else if textField == self.passwordTextField {
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.phoneNumberTextField {
            guard let aPhoneNum = textField.text else {
                return
            }
            if self.validatePhoneNumber(aPhoneNum) {
                self.phoneNumber = aPhoneNum
            }
        } else if textField == self.passwordTextField {
            guard let aPassword = textField.text else {
                return
            }
            if self.validatePassword(aPassword) {
                self.password = aPassword
            }
        }
        
        if self.phoneNumber != nil, self.password != nil {
            self.signinButton.isEnabled = true
        }
    }
}
