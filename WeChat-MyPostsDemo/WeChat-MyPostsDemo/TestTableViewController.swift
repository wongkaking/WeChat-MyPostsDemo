//
//  TestTableViewController.swift
//  project2
//
//  Created by kary on 2018/8/17.
//  Copyright © 2018年 kary. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {
    

    let anotherCellReuse = "another"
    var anotherModelArray : [[TestModel]]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UITableViewController自带一个tableView，所以不用重新创建，只需按照自己的要求初始化就可以了
//        let anotherTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height), style: .grouped)
//        anotherTableView.backgroundColor = .black
//        anotherTableView.tableFooterView = UIView()
//        view.addSubview(anotherTableView)
//        anotherTableView.delegate = self
//        anotherTableView.dataSource = self
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height), style: .grouped)
        tableView.tableFooterView = UIView()
        tableView.register(AnotherTableViewCell.self, forCellReuseIdentifier: anotherCellReuse)
        
        let test1 = TestModel(type: .DeputyCell, imageName: "icon1", title: "test1", userName: nil, userId: nil, iconName: nil)
        let test2 = TestModel(type: .DeputyCell, imageName: "icon2", title: "test2", userName: nil, userId: nil, iconName: nil)
        let test3 = TestModel(type: .DeputyCell, imageName: "icon3", title: "test3", userName: nil, userId: nil, iconName: nil)
        let test4 = TestModel(type: .DeputyCell, imageName: "icon4", title: "test4", userName: nil, userId: nil, iconName: nil)
        anotherModelArray = [[test1], [test2, test3], [test4]]
        
    }

    

    // MARK: - Table view data source

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
            cell.setValueForAnotherCell(iconImg: UIImage(named: model.imageName!)!, theLable: model.title!)
        
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
