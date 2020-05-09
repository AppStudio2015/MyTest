//
//  LoginViewController.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

/// 登录视图控制器
class SigninViewController: BaseViewController {
    
    public typealias SigninCompletion = (_ success: Bool) -> (Void)
    
    var signinCompletion: SigninCompletion?
    
    /// 登录模型
    fileprivate lazy var siginModel: SigninModel = {
        let model = SigninModel()
        
        return model
    }()
    
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

// MARK: - Private Methods

extension SigninViewController {
    
    fileprivate func handleSigninResult(_ result: AccountInfo) {
        // Save account information to AccountSession
        let accountSession = AccountSession.default
        accountSession.isSignedIn = true
        accountSession.accountInfo = result
        
        // Notify sigin success
        if let handler = self.signinCompletion {
            handler(true)
        }
        // Dismiss SiginViewController
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func signin(with phoneNumber: String, password: String) {
        self.signinView.startLoading()
        self.siginModel.signin(with: phoneNumber, password: password) { [unowned self] (isSignedIn, accountInfo) -> (Void) in
            self.signinView.stopLoading()
            
            if isSignedIn, let anAccountInfo = accountInfo {
                self.handleSigninResult(anAccountInfo)
                return
            }
            
            print("Sigin failed")
        }
    }
}

// MARK: - Public Methods

extension SigninViewController {
    
}

// MARK: - SiginViewDelegate

extension SigninViewController: SiginViewDelegate {
    
    func siginView(_ view: SigninView, didClickSigninWith phoneNubmer: String, password: String) {
        self.signin(with: phoneNubmer, password: password)
    }
    
    func siginView(_ view: SigninView, validatePhoneNumber phoneNumber: String, isValid: Bool) {
        if isValid == false {
            self.presentAlert("Warning", message: "Invalid phone number!")
        }
    }
    
    func siginView(_ view: SigninView, validatePassword password: String, isValid: Bool) {
        if isValid == false {
            self.presentAlert("Warning", message: "Invalid password!")
        }
    }
    
    func siginViewDidClickSignin(_ signinView: SigninView) {
        self.dismiss(animated: true) {
            // Finished
        }
    }
    func siginViewDidClickRegister(_ signinView: SigninView) {
        let viewController = SignupViewController()
        self.present(viewController, animated: true) {
            // Finished
        }
    }
}
