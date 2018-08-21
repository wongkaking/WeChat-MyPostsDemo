//
//  MainTableViewCell.swift
//  project2
//
//  Created by kary on 2018/8/15.
//  Copyright © 2018年 kary. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    var userImg : UIImageView = UIImageView()
    var userName : UILabel = UILabel()
    var userID : UILabel = UILabel()
    var userQR : UIImageView = UIImageView()
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        //        初始化设置icon的大小
//        icon = UIImageView.init(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
//        self.addSubview(icon)
//        //        初始化lable数据
//        theLable = UILabel.init(frame: CGRect(x: 40, y: 5, width: 50, height: 30))
//        theLable.font = UIFont.systemFont(ofSize: 15)
//        theLable.textAlignment = .left
//        self.addSubview(theLable)
        
        setUpUI()
    }
    
    private func setUpUI() {
        //        初始化设置icon的大小
//        icon = UIImageView.init(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
        
//        图片宽度约束
//        let iconWidth = NSLayoutConstraint(item: icon, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0, constant: 40)
//        icon.addConstraint(iconWidth)
        
//        约束userImg
        contentView.addSubview(userImg)
        userImg.translatesAutoresizingMaskIntoConstraints = false
        userImg.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        userImg.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        userImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        userImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
//        高度约束
//        let iconHeight = NSLayoutConstraint(item: icon, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0, constant: 40)
//        icon.addConstraint(iconHeight)
////        左边约束
//        let iconLeft = NSLayoutConstraint(item: icon, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 0, constant: 10)
//        icon.addConstraint(iconLeft)
////        垂直居中
//        let iconY = NSLayoutConstraint(item: icon, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.frame, attribute: NSLayoutAttribute.centerX, multiplier: 0, constant: 0)
//        icon.addConstraint(iconY)
//
        
        
        //        初始化lable数据
//        theLable = UILabel.init(frame: CGRect(x: 50, y: 5, width: 50, height: 30))
//        theLable.font = UIFont.systemFont(ofSize: 15)
//        theLable.textAlignment = .left
        
//              约束userName
        contentView.addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userName.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 15).isActive = true
        userName.topAnchor.constraint(equalTo: userImg.topAnchor).isActive = true
//        userName.font = UIFont.systemFont(ofSize: 14)
        
//        约束userID
        contentView.addSubview(userID)
        userID.translatesAutoresizingMaskIntoConstraints = false
        userID.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userID.heightAnchor.constraint(equalToConstant: 10).isActive = true
        userID.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 15).isActive = true
        userID.bottomAnchor.constraint(equalTo: userImg.bottomAnchor).isActive = true
        userID.font = UIFont.systemFont(ofSize: 14)
        
//        约束userQR Code
        contentView.addSubview(userQR)
        userQR.translatesAutoresizingMaskIntoConstraints = false
        userQR.widthAnchor.constraint(equalToConstant: 20).isActive = true
        userQR.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userQR.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        userQR.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
//      可以用约束数组激活约束，将各个约束赋值给一个常量
//        NSLayoutConstraint.activate([约束常量1， 约束常量2……])
    }
    
//    func setValueForCell(dic : NSDictionary){
//        userImg.image = UIImage(named: "icon.jpeg")
//        userName.text = "钱包"
//    }

    func setValueForMainCell(image : UIImage?, name : String?, userID : String?, qrCode : UIImage?){
        userImg.image = image
        userName.text = name
        self.userID.text = userID
        userQR.image = qrCode
    }

}
