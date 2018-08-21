//
//  SingleTextModel.swift
//  WeChat-MyPostsDemo
//
//  Created by kary on 2018/8/21.
//  Copyright © 2018年 kary. All rights reserved.
//

import UIKit

class SingleTextModel: NSObject {
    
    var imageName : String
    var userName : String
    var textLabel : String?
    var imgName : String?
    
    init(image:String, userName:String, theTextLable:String, img:String?) {
        imageName = image
        self.userName = userName
        self.textLabel = theTextLable
        imgName = img
        super.init()
    }
}
