import UIKit
import SnapKit
import Kingfisher

class RakCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()

    private lazy var coverImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rak")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var nick: UILabel = {
        let label = UILabel()
        label.text = "Kyojin"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.masksToBounds = true
        backgroundColor = .clear
        contentView.isUserInteractionEnabled = true
        selectionStyle = .none
        
        addSubview(containerView)
        containerView.addSubviews(coverImageView,nick)

        containerView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(24)
            make.right.bottom.equalToSuperview().offset(-24)
        }
        coverImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.height.width.equalTo(100)
        }
        nick.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(coverImageView.snp.right).offset(36)
        }
    }
}
