import UIKit

class BaseTextField: UITextField {
    
    // MARK: - Properties
    lazy var imageProfile: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    lazy var rightImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    lazy var actionButton = UIButton()

    // MARK: - Lifecycle
    required init?(coder: NSCoder) {fatalError("")}
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupViews()
    }
    
    // MARK: - Setup
    func setupViews() -> Void {
        text = ""
        textColor = .white
        delegate = self
        font = .airbnbCerealWMd(ofSize: 14)
        layer.cornerRadius = 16
        backgroundColor = .bottomColor
        
        let space = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 0))
        leftView = space
        leftViewMode = .always
        
        addSubview(imageProfile)
        imageProfile.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.width.height.equalTo(20)
        }
        addSubview(rightImage)
        rightImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        addSubview(actionButton)
        actionButton.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
}
extension BaseTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blueColor.cgColor
        textField.backgroundColor = .phioletColor
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.borderColor.cgColor
        textField.backgroundColor = .bottomColor
    }
}
