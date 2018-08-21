import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let singleTextReuse = "singleText"
    let singPhotoReuse = "singlePhoto"
    
    var testModel : [SingleTextModel]?
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (testModel?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = testModel?[indexPath.row] else { return UITableViewCell() }
        switch model.type {
        case .SingleText:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: singleTextReuse) as? SingleTextTableViewCell else { return UITableViewCell() }
            cell.setValueForSingletText(img: UIImage(named: model.imageName)!, userName: model.userName, text: model.textLabel!)
            return cell
        case .SinglePhoto:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: singPhotoReuse) as? SinglePhotoTableViewCell else { return UITableViewCell() }
            cell.setValueForSinglePhoto(image: UIImage(named: model.imageName)!, userName: model.userName, theText: model.textLabel!, photo: UIImage(named: model.imgName!)!)
            return cell
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(SingleTextTableViewCell.self, forCellReuseIdentifier: singleTextReuse)
        tableView.register(SinglePhotoTableViewCell.self, forCellReuseIdentifier: singPhotoReuse)
        
        let test1 = SingleTextModel(type: .SingleText, image: "image", userName: "test1", theTextLable: "111111111111111112222222222222233333333333", img: nil)
        let test2 = SingleTextModel(type: .SingleText, image: "image", userName: "test2", theTextLable: "111111111111111112222222222222233333333333",  img: nil)
        let test3 = SingleTextModel(type: .SinglePhoto, image: "image", userName: "test2", theTextLable: "111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333",  img: "image")
        let test4 = SingleTextModel(type: .SinglePhoto, image: "image", userName: "test4", theTextLable: "111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333",  img: "image")
        
        testModel = [test1, test2, test3, test4]
    }
    
    


}

