//
//  SinglePhotoTableViewCell.swift
//  WeChat-MyPostsDemo
//
//  Created by kary on 2018/8/21.
//  Copyright © 2018年 kary. All rights reserved.
//

import UIKit

class SinglePhotoTableViewCell: UITableViewCell {
    private var theImage = UIImageView()
    private var theUserName = UILabel()
    private var theTextLable = UILabel()
    private var img = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    func setUpUI(){
        contentView.addSubview(theImage)
        theImage.translatesAutoresizingMaskIntoConstraints = false
        theImage.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        theImage.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        theImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        theImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        
        contentView.addSubview(theUserName)
        theUserName.translatesAutoresizingMaskIntoConstraints = false
        theUserName.widthAnchor.constraint(equalToConstant: 100).isActive = true
        theUserName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        theUserName.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15).isActive = true
        theUserName.topAnchor.constraint(equalTo: theImage.topAnchor).isActive = true
        
        theTextLable.numberOfLines = 0
        contentView.addSubview(theTextLable)
        theTextLable.translatesAutoresizingMaskIntoConstraints = false
        theTextLable.topAnchor.constraint(equalTo: theUserName.bottomAnchor, constant: 15.0).isActive = true
        theTextLable.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15.0).isActive = true
        theTextLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0).isActive = true
        
        contentView.addSubview(img)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        img.topAnchor.constraint(equalTo: theTextLable.bottomAnchor, constant: 15.0).isActive = true
        img.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15.0).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15.0).isActive = true
    }
    
    func setValueForSinglePhoto(image : UIImage, userName : String, theText : String, photo : UIImage) {
        theImage.image = image
        theUserName.text = userName
        theTextLable.text = theText
        img.image = photo
    }
    
}
