import UIKit

class FourPhotosTableViewCell: UITableViewCell {
    private var theImage = UIImageView()
    private var theUserName = UILabel()
    private var theText = UILabel()
    private var image1 = UIImageView()
    private var image2 = UIImageView()
    private var image3 = UIImageView()
    private var image4 = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    func setUpUI()  {
        contentView.addSubview(theImage)
        theImage.translatesAutoresizingMaskIntoConstraints = false
        theImage.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        theImage.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        theImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        theImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        
        contentView.addSubview(theUserName)
        theUserName.translatesAutoresizingMaskIntoConstraints = false
        theUserName.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        theUserName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0).isActive = true
        theUserName.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15.0).isActive = true
        theUserName.topAnchor.constraint(equalTo: theImage.topAnchor).isActive = true
        
        contentView.addSubview(theText)
        theText.translatesAutoresizingMaskIntoConstraints = false
        theText.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15.0).isActive = true
        theText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0).isActive = true
        theText.topAnchor.constraint(equalTo: theUserName.bottomAnchor, constant: 15.0).isActive = true
        
        contentView.addSubview(image1)
        image1.translatesAutoresizingMaskIntoConstraints = false
        image1.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        image1.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        image1.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15.0).isActive = true
        image1.topAnchor.constraint(equalTo: theText.bottomAnchor, constant: 15.0).isActive = true
        
        contentView.addSubview(image2)
        image2.translatesAutoresizingMaskIntoConstraints = false
        image2.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        image2.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        image2.leadingAnchor.constraint(equalTo: image1.trailingAnchor, constant: 15.0).isActive = true
        image2.topAnchor.constraint(equalTo: image1.topAnchor).isActive = true
        
        contentView.addSubview(image3)
        image3.translatesAutoresizingMaskIntoConstraints = false
        image3.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        image3.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        image3.leadingAnchor.constraint(equalTo: theImage.trailingAnchor, constant: 15.0).isActive = true
        image3.topAnchor.constraint(equalTo: image1.bottomAnchor, constant: 10.0).isActive = true
        
        contentView.addSubview(image4)
        image4.translatesAutoresizingMaskIntoConstraints = false
        image4.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        image4.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        image4.topAnchor.constraint(equalTo: image3.topAnchor).isActive = true
        image4.leadingAnchor.constraint(equalTo: image3.trailingAnchor, constant: 15.0).isActive = true
        image4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15.0).isActive = true
    }
    
    func setValueForFourPhoto(image : UIImage, userName : String, theText : String, im1 : UIImage, im2 : UIImage, im3 : UIImage, im4 : UIImage)  {
        theImage.image = image
        theUserName.text = userName
        self.theText.text = theText
        image1.image = im1
        image2.image = im2
        image3.image = im3
        image4.image = im4
    }
}
