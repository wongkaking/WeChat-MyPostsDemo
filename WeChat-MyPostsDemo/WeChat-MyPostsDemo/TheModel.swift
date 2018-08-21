import UIKit

class TheModel: NSObject {
    enum theCellTpye {
        case SingleText
        case SinglePhoto
        case FourPhotos
    }
    
    let type : theCellTpye
    
    
    var imageName : String
    var userName : String
    var textLabel : String
    var im1 : String?
    var im2 : String?
    var im3 : String?
    var im4 : String?

    
    init(type : theCellTpye, image:String, userName:String, theTextLable:String, img1:String?, img2:String?, img3:String?, img4:String?) {
        self.type = type
        imageName = image
        self.userName = userName
        self.textLabel = theTextLable
        im1 = img1
        im2 = img2
        im3 = img3
        im4 = img4
        super.init()
    }
}
