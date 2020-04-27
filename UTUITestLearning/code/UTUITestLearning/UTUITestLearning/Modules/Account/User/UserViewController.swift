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
//        view.delegate = self
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
