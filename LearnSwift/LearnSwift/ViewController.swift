//
//  ViewController.swift
//  LearnSwift
//
//  Created by lei li on 2018/6/7.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var person = Person(name: "lilei", age: 18)
        print(person.name)
        var person1 = Person(info: ["name": "lilei", "age":18])
        print(person1)
        
        //相互引用
        var person2: Person? = Person(name: "lilei", age: 18)
        person2!.name = "lsb"
        var book: Book? = Book()
        book!.price = 1.4
        
        person2!.book = book
        book!.owen = person2
        
        person2 = nil
        book = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

