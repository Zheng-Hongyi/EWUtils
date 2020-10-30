//
//  ReusableView.swift
//  Declare
//
//  Created by Hongyi Zheng on 2017/9/12.
//  Copyright © 2017年 Hongyi Zheng. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
