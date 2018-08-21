import UIKit
//UIViewControllerPreviewingDelegate   3DTouch需要的委托方法
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let cellReuse = "mainCell"
    let secCellReuse = "secongCell"
    
    var modelArray: [[TestModel]]?
    
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
            cell.setValueForAnotherCell(iconImg: UIImage(named: model.imageName!)!, theLable: model.userName!)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = TestTableViewController()
 
        
        if indexPath.section == 0 {
            nextViewController.title = "My Profile"
            navigationController?.pushViewController(nextViewController, animated: true)
        }else if indexPath.section == 2 && indexPath.row == 1{
            let myPostController = MyPostsController()
            navigationController?.pushViewController(myPostController, animated: true)
        }else{
        nextViewController.title = modelArray?[indexPath.section][indexPath.row].userName
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelArray?.count ?? 0
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
//        UInavigationController部分
//        title = "me"
        navigationItem.title = "Me"
//        设置导航栏不透明
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
//        UItableView部分
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellReuse)
        tableView.register(AnotherTableViewCell.self, forCellReuseIdentifier: secCellReuse)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        
        let detail = TestModel(type: .MainCell, imageName: "icon", userName: "wong", userId: "123", iconName: "qr")
        let wallet = TestModel(type: .DeputyCell, imageName: "wallet", userName: "Wallet", userId: nil, iconName: nil)
        let favorites = TestModel(type: .DeputyCell, imageName: "favorites", userName: "Favorites", userId: nil, iconName: nil)
        let myPost = TestModel(type: .DeputyCell, imageName: "photos", userName: "My Posts", userId: nil, iconName: nil)
        let cardAndOffers = TestModel(type: .DeputyCell, imageName: "card", userName: "Card & Offers", userId: nil, iconName: nil)
        let stickerGallery = TestModel(type: .DeputyCell, imageName: "sticker", userName: "Sticker Gallery", userId: nil, iconName: nil)
        let setting = TestModel(type: .DeputyCell, imageName: "setting", userName: "Setting", userId: nil, iconName: nil)
        
        modelArray = [ [detail] , [wallet], [favorites, myPost, cardAndOffers, stickerGallery], [setting]]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

