import UIKit
import SnapKit
import Kingfisher

class NewsCell: UITableViewCell {
    var url: String?
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Новость"
        label.numberOfLines = 3
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private lazy var newsInfo: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var link: UIButton = {
        let button = UIButton()
        button.setTitle("Ссылка", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.blueColor, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        if let url = URL(string: self.url ?? "") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Невозможно открыть URL")
            }
        }
    }
    
    private func setupViews() {
        layer.masksToBounds = true
        backgroundColor = .clear
        contentView.isUserInteractionEnabled = true
        selectionStyle = .none
        
        addSubview(containerView)
        containerView.addSubviews(title,
                                  newsInfo,
                                  link)

        containerView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(12)
            make.bottom.right.equalToSuperview().offset(-12)
        }
        title.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        newsInfo.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-2)
        }
        link.snp.makeConstraints { make in
            make.top.equalTo(newsInfo.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    func configure(model: News) {
        title.text = model.title
        newsInfo.text = model.description
        self.url = model.link
    }
}
