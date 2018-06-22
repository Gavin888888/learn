//
//  Book.swift
//  LearnSwift
//
//  Created by lei li on 2018/6/7.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit
@objc protocol BookProtocol {
    @objc optional func buyBook(book:Book)
}
class Book: NSObject {
    weak var delegate: BookProtocol?
    var price: Double = 0.0
    weak var owen: Person?
    deinit {
        print("Book销毁")
    }
    func buyBook() {
        print("----")
        delegate?.buyBook!(book: self)
    }
}
