//
//  UserView.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/27.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

// MARK: - UserViewDelegate

/// 用户视图代理
protocol UserViewDelegate: NSObjectProtocol {
    /// 头像点击回调
    /// - Parameter view: 用户视图
    func userViewDidClickAvatar(_ view: UserView)
    /// 设置列表点击回调
    /// - Parameters:
    ///   - view: 用户视图
    ///   - index: 点击索引
    func userView(_ view: UserView, didSelectSettingItemAt index: Int)
}

protocol ViewDataLoadable {
    associatedtype DataType
    func loadData(_ data: DataType?)
}

// MARK: - UserView

/// 用户视图
class UserView: BaseView {
    /// 头像
    @IBOutlet weak var avatarBtn: UIButton! {
        didSet {
            if oldValue == nil {
                avatarBtn.layer.cornerRadius = 12
                avatarBtn.layer.masksToBounds = true
                avatarBtn.addTarget(self, action: #selector(didClickAvatar(_:)), for: .touchUpInside)
            }
        }
    }
    
    /// 昵称
    @IBOutlet weak var nickName: UILabel!
    
    /// 设置列表
    @IBOutlet weak var settingTableView: UITableView! {
        didSet {
            if oldValue == nil {
//                settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
                settingTableView.delegate = self
                settingTableView.dataSource = self
            }
        }
    }
    
    /// 代理
    public weak var delegate: UserViewDelegate?
    
    /// 默认设置项
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

// MARK: - Target Actions
extension UserView {
    /// 头像点击处理
    /// - Parameter button: 头像按钮
    /// - Returns: 无
    @objc fileprivate func didClickAvatar(_ button: UIButton) {
        print("Avatar Clicked.")
        self.delegate?.userViewDidClickAvatar(self)
    }
}

// MARK: - Public Methods

extension UserView: ViewDataLoadable {
    typealias DataType = AccountInfo
    
    func loadData(_ data: DataType?) {
        if let imageName = data?.userAvatar, let avatar: UIImage = UIImage(named: imageName) {
            self.avatarBtn.setImage(avatar, for: .normal)
            self.avatarBtn.setTitle(nil, for: .normal)
        }
        
        self.nickName.text = data?.userName
    }
}

// MARK: - UITableViewDataSource

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

// MARK: - UITableViewDelegate

extension UserView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.userView(self, didSelectSettingItemAt: indexPath.row)
    }
}
