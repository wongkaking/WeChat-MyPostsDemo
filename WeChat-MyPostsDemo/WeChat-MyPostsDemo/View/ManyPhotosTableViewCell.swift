//
//  ManyPhotosTableViewCell.swift
//  WeChat-MyPostsDemo
//
//  Created by kary on 2018/8/23.
//  Copyright © 2018年 kary. All rights reserved.
//

import UIKit

class ManyPhotosTableViewCell: UITableViewCell {
    private var theImage = UIImageView()
    private var theUserName = UILabel()
    private var theText = UILabel()
    private var theView = PhotosView()
    private var picArray : [String]?
    private var model:TheModel?

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setUpUI()
        contentView.addSubview(theImage)
        contentView.addSubview(theUserName)
        contentView.addSubview(theText)
        contentView.addSubview(theView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setUpUI()
    }
    
    func setUpUI() {
        
        theImage.translatesAutoresizingMaskIntoConstraints = false
        theImage.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        theImage.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        theImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        theImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        
        
        theUserName.translatesAutoresizingMaskIntoConstraints = false
        theUserName.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        theUserName.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15.0).isActive = true
        theUserName.topAnchor.constraint(equalTo: theImage.topAnchor).isActive = true
        theUserName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0).isActive = true
        
        
        theText.numberOfLines = 0
        theText.translatesAutoresizingMaskIntoConstraints = false
        theText.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15.0).isActive = true
        theText.topAnchor.constraint(equalTo: theUserName.bottomAnchor, constant: 15.0).isActive = true
        theText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0).isActive = true
        
        theView.setValueForPicArray(picAry: picArray!)
        
        theView.translatesAutoresizingMaskIntoConstraints = false
        theView.topAnchor.constraint(equalTo: theText.bottomAnchor, constant: 5.0).isActive = true
        theView.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 5.0).isActive = true
        theView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0).isActive = true
        theView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        theView.heightAnchor.constraint(equalToConstant: theView.getViewHeight(picArray: picArray)).isActive = true
    }
    func setValueForManyPhotos(image:UIImage, userName:String, theText:String, picArray: [String]?){
        self.picArray = picArray
        setUpUI()
        theImage.image = image
        theUserName.text = userName
        self.theText.text = theText
    }
    
    func setValueForManyPhotos(model:TheModel)  {
        self.model = model
        picArray = model.imageArray
        theImage.image = UIImage(named: model.imageName)
        theUserName.text = model.userName
        self.theText.text = model.textLabel
        setUpUI()
    }

}
