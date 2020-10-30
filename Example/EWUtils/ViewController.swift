//
//  ViewController.swift
//  EWUtils
//
//  Created by zhenghongyi on 10/20/2020.
//  Copyright (c) 2020 zhenghongyi. All rights reserved.
//

import UIKit
import EWUtils

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        EWLog.d("Hello")
        testKeyChain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testKeyChain() {
        let aItem = EWKeychainItem.init(aTag: "123")
        do {
            var resultStr: String?
            try resultStr = aItem.readInfo()
            if let aStr = resultStr {
                EWLog.d("has" + aStr)
            }
        } catch  {
            do {
                var result = false
                try result = aItem.saveInfo("123")
                if result { // 保存成功
                    EWLog.d("save succeess")
                }
            } catch { }
        }
        
    }

}

