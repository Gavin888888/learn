//
//  FirstViewController.swift
//  LearnSwift
//
//  Created by lei li on 2018/6/21.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var httpTools:HttpTools?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        addBtn()
        httpTools = HttpTools()
    }
    deinit {
        print(" FirstViewController - deinit")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //这里必须用 weak 修饰 不然会产生循环引用
        weak var weakself: UIViewController? = self
        httpTools?.loadData({ (jsonData) in
            weakself?.view.backgroundColor = UIColor.orange
            print("打印结果\(jsonData)")
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        self.dismiss(animated: true) {
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
