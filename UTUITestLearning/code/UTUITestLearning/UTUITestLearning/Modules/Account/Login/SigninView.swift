//
//  LoginView.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

// MARK: - SiginViewDelegate
protocol SiginViewDelegate: NSObjectProtocol {
    
    func siginViewDidClickSignin(_ signinView: SigninView)
    
    func siginViewDidClickRegister(_ signinView: SigninView)
}

// MARK: - SigninView
class SigninView: BaseView {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signinButton: UIButton! {
        didSet {
            if oldValue == nil {
                signinButton.layer.cornerRadius = 6
                signinButton.layer.masksToBounds = true
                signinButton.addTarget(self, action: #selector(didClickSignButton(_:)), for: .touchUpInside)
            }
        }
    }
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            if oldValue == nil {
                registerButton.addTarget(self, action: #selector(didClickRegisterButton(_:)), for: .touchUpInside)
            }
        }
    }
    
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

extension SigninView {
    
    @objc fileprivate func didClickSignButton(_ button: UIButton) {
        print("\(#function)")
        self.delegate?.siginViewDidClickSignin(self)
    }
    
    @objc fileprivate func didClickRegisterButton(_ button: UIButton) {
        print("\(#function)")
        self.delegate?.siginViewDidClickRegister(self)
    }
}
