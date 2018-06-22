//
//  Person.swift
//  LearnSwift
//
//  Created by lei li on 2018/6/7.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit
/* kvc赋值
 1.继承 NSObject
 2.初始化方法调用 super.init()
 3.实现 setValuesForKeys(info)
 4.重写 setValue forUndefinedKey
 */
class Person: NSObject {
    @objc var name: String = ""
    @objc var age: Int = 0
    weak var book: Book?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    deinit {
        print("Person销毁")
    }
    init(info:[String: Any]) {
        super.init()
        setValuesForKeys(info)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}

