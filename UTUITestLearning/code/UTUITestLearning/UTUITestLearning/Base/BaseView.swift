//
//  BaseView.swift
//  UTUITestLearning
//
//  Created by qufei on 2020/4/27.
//  Copyright © 2020 qufei. All rights reserved.
//

import UIKit

// MARK: - NibLoadable
protocol NibLoadable {
    associatedtype TargetView
    
    /// Layout view that generate from a nib file
    func layoutNibView() -> Void
    
    /// load a nib file
    func loadNib() -> TargetView?
}

extension NibLoadable {
    func layoutNibView() -> Void {}
    func loadNib() -> TargetView? {return nil}
}

// MARK: - BaseView
class BaseView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension BaseView: NibLoadable {
    typealias TargetView = UIView
    
    /// Layout the view that generates from a nib file
    public func layoutNibView() {
        guard let view = self.loadNib() else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    /// Generate an UIView from Nib
    /// - Returns: a target view
    public func loadNib() -> TargetView? {
        let bundle = Bundle(for: type(of: self))
        guard let nibName = type(of: self).description().components(separatedBy: ".").last else {
            return nil
        }
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
}
