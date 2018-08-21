import UIKit

class SingleTextModel: NSObject {
    enum singleCellTpye {
        case SingleText
        case SinglePhoto
    }
    
    let type : singleCellTpye
    
    
    var imageName : String
    var userName : String
    var textLabel : String?
    var imgName : String?
    
    init(type : singleCellTpye, image:String, userName:String, theTextLable:String, img:String?) {
        self.type = type
        imageName = image
        self.userName = userName
        self.textLabel = theTextLable
        imgName = img
        super.init()
    }
}
