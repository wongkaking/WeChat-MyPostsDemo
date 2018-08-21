import UIKit

class TestModel: NSObject {
    
    enum cellType {
        case MainCell
        case DeputyCell
    }
    
    let type : cellType
    
    var imageName: String?
    var title: String?
    var userName: String?
    var userId: String?
    var iconName: String?
    
    init(type: cellType, imageName: String?, title: String?, userName: String?, userId: String?, iconName: String?) {
        self.type = type
        super.init()
        self.imageName = imageName
        self.title = title
        self.userName = userName
        self.userId = userId
        self.iconName = iconName
    }
    
}
