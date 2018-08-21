import UIKit

class TestTableViewController: UITableViewController {
    

    let anotherCellReuse = "another"
    var anotherModelArray : [[TestModel]]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title =
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height), style: .grouped)
        tableView.tableFooterView = UIView()
        tableView.register(AnotherTableViewCell.self, forCellReuseIdentifier: anotherCellReuse)
        
        let test1 = TestModel(type: .DeputyCell, imageName: "icon1", userName: "test1", userId: nil, iconName: nil)
        let test2 = TestModel(type: .DeputyCell, imageName: "icon2", userName: "test2", userId: nil, iconName: nil)
        let test3 = TestModel(type: .DeputyCell, imageName: "icon3", userName: "test3", userId: nil, iconName: nil)
        let test4 = TestModel(type: .DeputyCell, imageName: "icon4", userName: "test4", userId: nil, iconName: nil)
        anotherModelArray = [[test1], [test2, test3], [test4]]
        

        
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return anotherModelArray?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anotherModelArray?[section].count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = anotherModelArray?[indexPath.section][indexPath.row] else {
            return UITableViewCell()
        }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: anotherCellReuse) as? AnotherTableViewCell else{ return UITableViewCell() }
            cell.accessoryType = .disclosureIndicator
            cell.setValueForAnotherCell(iconImg: UIImage(named: model.imageName!)!, theLable: model.userName!)
        
        //这里是添加判断是否支持3D Touch的代码
            if #available(iOS 9.0, *) {
                if traitCollection.forceTouchCapability == .available {
                    //支持3D Touch
                    //注册Peek & Pop功能
                    self.registerForPreviewing(with: self as! UIViewControllerPreviewingDelegate, sourceView: cell)
                }
            }
            return cell
        }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

}
