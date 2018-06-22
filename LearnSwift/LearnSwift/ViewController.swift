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
        book?.delegate = self as? BookProtocol
        book!.price = 1.4
        book?.buyBook()
        
//        person2!.book = book
//        book!.owen = person2
        
//        person2 = nil
//        book = nil
        self.addBtn()
    }
    
    func addBtn(){
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.setTitle("跳转到firestViewController", for: UIControlState.normal)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    @objc func btnClick(){
        print("------")
        let firstVc = FirstViewController()
//        self.navigationController?.pushViewController(firstVc, animated: true)
        self.present(firstVc, animated: true) {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension BookProtocol{
    func buyBook(book:Book){
        print(book.price)
    }
}
