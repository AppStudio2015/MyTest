//
//  UserViewController.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/27.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

class UserViewController: BaseViewController {
    
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

extension UserViewController: UserViewDelegate {
    func userViewDidClickAvatar(_ view: UserView) {
        self.present(SigninViewController(), animated: true) {
            //Finished
        }
    }
    
    func userView(_ view: UserView, didSelectSettingItemAt index: Int) {
        let viewController: UserSettingViewController = UserSettingViewController()
        viewController.title = "Settings"
        viewController.view.backgroundColor = UIColor.white
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
