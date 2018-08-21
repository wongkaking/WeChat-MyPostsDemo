import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let singleTextReuse = "singleText"
    let singPhotoReuse = "singlePhoto"
    let fourPhotosReuse = "four"
    
    
    var testModel : [TheModel]?
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (testModel?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = testModel?[indexPath.row] else { return UITableViewCell() }
        switch model.type {
        case .SingleText:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: singleTextReuse) as? SingleTextTableViewCell else { return UITableViewCell() }
            cell.setValueForSingletText(img: UIImage(named: model.imageName)!, userName: model.userName, text: model.textLabel)
            return cell
        case .SinglePhoto:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: singPhotoReuse) as? SinglePhotoTableViewCell else { return UITableViewCell() }
            cell.setValueForSinglePhoto(image: UIImage(named: model.imageName)!, userName: model.userName, theText: model.textLabel, photo: UIImage(named: model.im1!)!)
            return cell
        case .FourPhotos:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: fourPhotosReuse)as? FourPhotosTableViewCell else { return UITableViewCell() }
            cell.setValueForFourPhoto(image: UIImage(named: model.imageName)!, userName: model.userName, theText: model.textLabel, im1: UIImage(named: model.im1!)!, im2: UIImage(named: model.im2!)!, im3: UIImage(named: model.im3!)!, im4: UIImage(named: model.im4!)!)
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
        tableView.register(FourPhotosTableViewCell.self, forCellReuseIdentifier: fourPhotosReuse)
        
        let test1 = TheModel(type: .FourPhotos, image: "image", userName: "test1", theTextLable: "111111111111111112222222222222233333333333", img1: "image", img2: "image2", img3: "image3", img4: "image4")
        let test2 = TheModel(type: .SingleText, image: "image", userName: "test2", theTextLable: "111111111111111112222222222222233333333333",  img1: nil, img2: nil, img3: nil, img4: nil)
        let test3 = TheModel(type: .SinglePhoto, image: "image", userName: "test2", theTextLable: "111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333",  img1: "image", img2: nil, img3: nil, img4: nil)
        let test4 = TheModel(type: .SinglePhoto, image: "image", userName: "test4", theTextLable: "111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333111111111111111112222222222222233333333333",  img1: "image", img2: nil, img3: nil, img4: nil)
        
        testModel = [test1, test2, test3, test4]
    }
    
    


}

