//
//  Book.swift
//  LearnSwift
//
//  Created by lei li on 2018/6/7.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit

class Book: NSObject {
    var price: Double = 0.0
    weak var owen: Person?
    deinit {
        print("Book销毁")
    }
}
