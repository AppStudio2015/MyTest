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
    
    fileprivate func handleSigninResult(_ result: Data) {
        let accountSession = AccountSession.default
        let accInfo: AccountInfo = AccountInfo(userId: "123456", userToken: "qazwsxcde", phoneNumber: "12345678900", userName: "Tony", userAvatar: "ic_person_48pt")
        accountSession.isSignedIn = true
        accountSession.accountInfo = accInfo
        if let handler = self.signinCompletion {
            handler(true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func signin(with phoneNumber: String, password: String) {
        self.signinView.startLoading()
        AccountService.signin(with: phoneNumber, password: password) { [unowned self](data, error) -> (Void) in
            self.signinView.stopLoading()
            
            if let anError = error {
                print("An \(anError) occur!")
                return
            }
            
            guard let aData = data else {
                print("No data!")
                return
            }
            
            print("Response: \(aData)")
            self.handleSigninResult(aData)
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
