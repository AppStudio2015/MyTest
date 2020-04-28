//
//  UserView.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/27.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

// MARK: - UserViewDelegate
protocol UserViewDelegate: NSObjectProtocol {
    func userViewDidClickAvatar(_ view: UserView)
    func userView(_ view: UserView, didSelectSettingItemAt index: Int)
}

// MARK: - UserView
class UserView: BaseView {

    @IBOutlet weak var avatarBtn: UIButton! {
        didSet {
            if oldValue == nil {
                avatarBtn.layer.cornerRadius = 12
                avatarBtn.layer.masksToBounds = true
                avatarBtn.addTarget(self, action: #selector(didClickAvatar(_:)), for: .touchUpInside)
            }
        }
    }
    
    @IBOutlet weak var nickName: UILabel!
    
    @IBOutlet weak var settingTableView: UITableView! {
        didSet {
            if oldValue == nil {
//                settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
                settingTableView.delegate = self
                settingTableView.dataSource = self
            }
        }
    }
    
    public weak var delegate: UserViewDelegate?
    
    fileprivate lazy var settingModel: UserSettingModel = {
        let model = UserModel.defaultSettingModel()
        return model
    }()
    
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

extension UserView {
    
    @objc fileprivate func didClickAvatar(_ button: UIButton) -> Void {
        print("Avatar Clicked.")
        self.delegate?.userViewDidClickAvatar(self)
    }
}

extension UserView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch settingModel {
        case .section0(let models):
            return models?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell.accessoryType = .disclosureIndicator
        }
        switch settingModel {
        case .section0(let models):
            cell.imageView?.image = models?[indexPath.row].icon
            cell.textLabel?.text = models?[indexPath.row].title ?? "Title"
            cell.detailTextLabel?.text = models?[indexPath.row].detail ?? "Detail"
        default:
            cell.textLabel?.text = "Title"
            cell.detailTextLabel?.text = "Detail"
        }
        
        return cell
    }
}

extension UserView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.userView(self, didSelectSettingItemAt: indexPath.row)
    }
}

