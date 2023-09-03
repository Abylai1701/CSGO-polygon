import UIKit

class SocialNetButton: UIView {
    
    //MARK: - Properties
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .bottomColor
        return view
    }()
    lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .airbnbCerealWMd(ofSize: 16)
        return label
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
            make.height.equalTo(72)
        }
        titleView.addSubviews(iconView,
                              titleLabel)
        iconView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(12)
            make.centerY.equalTo(iconView)
            make.right.equalToSuperview()
        }
        mainView.addSubviews(titleView,
                    actionButton)
        titleView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        actionButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func configure(model: SocialNet) {
        iconView.image = model.getImage()
        titleLabel.text = model.getTitle()
    }
}
