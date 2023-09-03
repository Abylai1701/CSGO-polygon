import UIKit

class SocialNetImageButton: UIView {
    
    //MARK: - Properties
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .bottomColor
        return view
    }()
    lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        mainView.layer.borderWidth = 1
        mainView.layer.cornerRadius = 16
        mainView.layer.borderColor = UIColor.borderColor.cgColor
        
        addSubviews(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(59)
            make.width.equalTo(88)
        }
        mainView.addSubviews(iconView,
                    actionButton)
        iconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(24)
        }
        actionButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func configure(model: SocialNet) {
        iconView.image = model.getImage()
    }
}
