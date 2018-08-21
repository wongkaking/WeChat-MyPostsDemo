import UIKit
//UIViewControllerPreviewingDelegate   3DTouch需要的委托方法
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let cellReuse = "mainCell"
    let secCellReuse = "secongCell"
    
    var modelArray: [[TestModel]]?
//    var data:[[String]] = [["wong"] ,["Waller"],["Favorites", "My Posts", "Cards & Offers", "Sticker Gallery"], ["Settings"]]
//    var secData = ["123"]
//    let imageData : [[UIImage]]? = [
//        [UIImage(named: "icon.jpeg")!],
//        [UIImage(named:"wallet.png")!],
//        [UIImage(named: "favorites.png")!,UIImage(named: "photos.png")!, UIImage(named: "card.png")!, UIImage(named: "sticker.png")!],
//        [UIImage(named: "setting.png")!]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 70 : 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = modelArray?[indexPath.section][indexPath.row] else {
            return UITableViewCell()
        }
        
        switch model.type {
        case .MainCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as?       MainTableViewCell else { return UITableViewCell() }
            cell.accessoryType = .disclosureIndicator
            cell.setValueForMainCell(image: UIImage(named: model.imageName!), name: model.userName, userID: model.userId, qrCode: UIImage(named: model.iconName!))
            return cell
        case .DeputyCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: secCellReuse) as? AnotherTableViewCell else{ return UITableViewCell() }
            cell.accessoryType = .disclosureIndicator
            cell.setValueForAnotherCell(iconImg: UIImage(named: model.imageName!)!, theLable: model.title!)
            return cell
        }
        
//        if indexPath.row == 0 && indexPath.section == 0{
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse) as?       MainTableViewCell else {
//            return UITableViewCell()
//        }
//            cell.accessoryType = .disclosureIndicator
//
////                      var dic = Dictionary<String, String>()
////                      dic["name"] = data[indexPath.row]
////                      cell.setValueForCell(dic: dic as NSDictionary)
//
////            cell.userName.text = data[indexPath.section][indexPath.row]
////            cell.userImg.image = imageData![indexPath.section][indexPath.row]
////            cell.userID.text = secData[indexPath.row]
////            cell.userQR.image = #imageLiteral(resourceName: "qr")
//
//            cell.setValueForMainCell(image: imageData![indexPath.section][indexPath.row], name: data[indexPath.section][indexPath.row], userID: secData[indexPath.row], qrCode: #imageLiteral(resourceName: "qr"))
//                return cell
//
//        }else{
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: secCellReuse) as? AnotherTableViewCell else{
//                return UITableViewCell()
//            }
//            cell.accessoryType = .disclosureIndicator
////            cell.lableName.text = data[indexPath.section][indexPath.row]
////            cell.theIcon.image = imageData![indexPath.section][indexPath.row]
//
//            cell.setValueForAnotherCell(iconImg: imageData![indexPath.section][indexPath.row], theLable: data[indexPath.section][indexPath.row])
//
//            return cell
//        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = TestTableViewController()
        present(nextViewController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelArray?.count ?? 0
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellReuse)
        tableView.register(AnotherTableViewCell.self, forCellReuseIdentifier: secCellReuse)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        
        let detail = TestModel(type: .MainCell, imageName: "icon", title: nil, userName: "wong", userId: "123", iconName: "qr")
        let wallet = TestModel(type: .DeputyCell, imageName: "wallet", title: "Wallet", userName: nil, userId: nil, iconName: nil)
        let favorites = TestModel(type: .DeputyCell, imageName: "favorites", title: "Favorites", userName: nil, userId: nil, iconName: nil)
        let myPost = TestModel(type: .DeputyCell, imageName: "photos", title: "My Posts", userName: nil, userId: nil, iconName: nil)
        let cardAndOffers = TestModel(type: .DeputyCell, imageName: "card", title: "Card & Offers", userName: nil, userId: nil, iconName: nil)
        let stickerGallery = TestModel(type: .DeputyCell, imageName: "sticker", title: "Sticker Gallery", userName: nil, userId: nil, iconName: nil)
        let setting = TestModel(type: .DeputyCell, imageName: "setting", title: "Setting", userName: nil, userId: nil, iconName: nil)
        
        modelArray = [ [detail] , [wallet], [favorites, myPost, cardAndOffers, stickerGallery], [setting]]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

