//
//  BaseViewController.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/27.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

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
    
    class func rootViewController() -> UIViewController {
        return UIApplication.shared.keyWindow!.rootViewController!
    }
      
    func presentAlert(_ title: String, message: String) {
      let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alertView.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
      })
      self.present(alertView, animated: true, completion: nil)
    }
}
