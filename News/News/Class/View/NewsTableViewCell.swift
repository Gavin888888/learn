//
//  NewsTableViewCell.swift
//  News
//
//  Created by lei li on 2018/6/22.
//  Copyright © 2018年 lei li. All rights reserved.
//

import UIKit
import Kingfisher
class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var replayCountLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    var dataModel: NewsModel? {
        didSet{
            titleLabel.text = dataModel?.title
            subTitleLabel.text = dataModel?.source
            replayCountLabel.text = "\(dataModel?.replyCount ?? 0)跟帖"
            //设置图片
            let url = URL(string: (dataModel?.imgsrc)!)
            iconImage.kf.setImage(with: url)
        }
    }
    
}
