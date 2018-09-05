//
//  PhotosView.swift
//  WeChat-MyPostsDemo
//
//  Created by kary on 2018/8/23.
//  Copyright © 2018年 kary. All rights reserved.
//

import UIKit

let space : CGFloat = 10
let photoWidth : CGFloat = (UIScreen.main.bounds.size.width-80.0-(space*4.0))/3.0
class PhotosView: UIView {
    private var picArray  = [String]()
    private let photoHeight : CGFloat = photoWidth
    

    func setValueForPicArray(picAry : [String]){
        subviews.forEach { (imageView) in
            imageView.removeFromSuperview()
        }
        picArray = picAry
        for index in 0..<picArray.count{
            let img = UIImageView(frame: CGRect(x: space + CGFloat(index%3) * (photoWidth+space), y: space + CGFloat(index/3)*(space + photoHeight), width: photoWidth, height: photoHeight))
            img.image = UIImage(named: picArray[index])
            addSubview(img)
        }
        
    }
    
    func getViewHeight(picArray: [String]?) -> CGFloat {
        guard let picArray = picArray else { return 0 }
        return space + (space+photoHeight)*CGFloat((picArray.count-1)/3+1)
    }
    
    func setUpView()  {
        var viewWidth : CGFloat = 0
        var viewHeight : CGFloat = 0
        
        if picArray.count == 0 {
            self.heightAnchor.constraint(equalToConstant: 0.0).isActive = true
            self.widthAnchor.constraint(equalToConstant: 0.0).isActive = true
        }else if picArray.count == 2{
            viewWidth = space * 3 + photoWidth * 2
            viewHeight = space * 2 + photoHeight
            self.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
            self.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        }else if picArray.count >= 3{
            viewWidth = space * 4 + photoWidth * 3
            if picArray.count <= 6
            {
                viewHeight = space * 3 + photoHeight * 2
                self.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
                self.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
            }else if picArray.count <= 9{
                viewHeight = space * 4 + photoHeight * 3
                self.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
                self.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
            }
        }
    }
}
