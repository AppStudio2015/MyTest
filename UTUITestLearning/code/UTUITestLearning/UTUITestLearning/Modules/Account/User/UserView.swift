//
//  UserView.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/27.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

class UserView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutNibView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layoutNibView()
    }
    
}
