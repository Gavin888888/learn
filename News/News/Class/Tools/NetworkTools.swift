//
//  NetworkTools.swift
//  News
//
//  Created by lei li on 2018/6/22.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit
import Alamofire
enum MethodType {
    case get
    case post
}
class NetworkTools: NSObject {
    class func requestData(URLString: String,type: MethodType , parameters:[String: Any]? = nil , finishedCallBack: @escaping  (_ responsData: Any) -> ())  {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON{ (responseData) in
            guard let result = responseData.result.value else {
                print(responseData.result.error)
                return
            }
            finishedCallBack(result)
        }
    }
}
