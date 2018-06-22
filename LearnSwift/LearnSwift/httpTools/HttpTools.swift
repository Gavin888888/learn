//
//  HttpTools.swift
//  LearnSwift
//
//  Created by lei li on 2018/6/21.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit

class HttpTools: NSObject {
    var finishCallBack:((_ jsonData: String) -> ())?
    
    func loadData(_ finishedCallBack: @escaping(_ _jsonData: String) -> ()){
        finishCallBack = finishedCallBack
        let queue = DispatchQueue(label: "httpTools")
        queue.async {
            print("开始发送网络请求\(Thread.current)")
            DispatchQueue.main.sync {
                print("得到请求数据\(Thread.current)")
                finishedCallBack("li")
            }
        }
    }
}
