import UIKit

class AnotherTableViewCell: UITableViewCell {
    var theIcon : UIImageView = UIImageView()
    var lableName = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    func setUpUI() {
        contentView.addSubview(theIcon)
        
        theIcon.translatesAutoresizingMaskIntoConstraints = false
        theIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        theIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        theIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        theIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(lableName)
        lableName.translatesAutoresizingMaskIntoConstraints = false
        lableName.widthAnchor.constraint(equalToConstant: 160).isActive = true
        lableName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lableName.leadingAnchor.constraint(equalTo: theIcon.trailingAnchor, constant: 15).isActive = true
        lableName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func setValueForAnotherCell(iconImg : UIImage, theLable : String)  {
        theIcon.image = iconImg
        lableName.text = theLable
    }

}
