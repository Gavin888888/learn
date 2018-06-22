//
//  HomeViewController.swift
//  News
//
//  Created by lei li on 2018/6/22.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit
private let KHomeCellID = "NewsTableViewCell"
class HomeViewController: UIViewController {
    fileprivate lazy var dataSources:[NewsModel]? = [NewsModel]()
    fileprivate lazy var tableView: UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.dataSource = self as! UITableViewDataSource
        tableView.frame = self.view.bounds
        tableView.register(UINib(nibName: KHomeCellID, bundle: nil), forCellReuseIdentifier: KHomeCellID)
        tableView.rowHeight = 90
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        view.addSubview(tableView)
        loadData()
    }
}
extension HomeViewController{
    func setNavigationBar() {
        //1.设置导航栏北京颜色
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigation_image_red"), for: .default)
        //2.设置titleView
        navigationItem.titleView = UIImageView(image: UIImage(named: "navigation_logo"))
        //3.设置rigthBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigation_search"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(searchItemClick))
    }
    @objc func searchItemClick() {
        print("------")
    }
}
extension HomeViewController{
    fileprivate func loadData() {
        NetworkTools.requestData(URLString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get) { (data) in
            print(data)
            //数据解析
            guard let resultDict = data as?[String : Any] else { return }
            guard let dataArray = resultDict["T1348649079062"] as? [[String : Any]] else { return }
            for dict in dataArray{
                let temp = NewsModel(info: dict)
                self.dataSources?.append(temp)
            }
            self.tableView.reloadData()
        }
    }
}
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataSources?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: KHomeCellID , for: indexPath) as! NewsTableViewCell
        cell.dataModel = self.dataSources?[indexPath.row]
        return cell
    }
}
