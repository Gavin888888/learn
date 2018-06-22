//
//  NewsModel.swift
//  News
//
//  Created by lei li on 2018/6/22.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit

class NewsModel: NSObject {
    @objc var docid = ""
    @objc var skipID = ""
    @objc var lmodify = ""
    @objc var source = ""
    @objc var title = ""
    @objc var mtime = ""
    @objc var skipType = ""
    @objc var digest = ""
    @objc var TAG = ""
    @objc var imgsrc = ""
    @objc var ptime = ""
    @objc var TAGS = ""
    @objc var replyCount = 0
    
    init(info:[String: Any]) {
        super.init()
        setValuesForKeys(info)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
