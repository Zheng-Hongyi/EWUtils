//
//  NibLoadableView.swift
//  Declare
//
//  Created by Hongyi Zheng on 2017/9/12.
//  Copyright © 2017年 Hongyi Zheng. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String.init(describing: self)
    }
}
