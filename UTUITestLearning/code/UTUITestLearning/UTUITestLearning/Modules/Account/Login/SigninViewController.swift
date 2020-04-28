//
//  LoginViewController.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/26.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {
    
    fileprivate lazy var signinView: SigninView = {
        let view = SigninView.init(frame: self.view.bounds)
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = self.signinView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

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
