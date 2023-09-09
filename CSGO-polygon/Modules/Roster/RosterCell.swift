import UIKit
import SnapKit
import Kingfisher

class RosterCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var coverImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Tima")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var level: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "level1")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var nick: UILabel = {
        let label = UILabel()
        label.text = "Kyojin"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var role: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "awp")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        
        return view
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
        
        let overlayView = UIView()
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerView)
        containerView.addSubview(coverImageView)
        containerView.addSubview(overlayView)
        containerView.addSubviews(level, nick, role)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        coverImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(240)
        }
        level.snp.makeConstraints { make in
            make.centerX.equalTo(coverImageView.snp.centerX)
            make.centerY.equalTo(coverImageView.snp.centerY)
            make.width.height.equalTo(56)
        }
        nick.snp.makeConstraints { make in
            make.centerX.equalTo(coverImageView.snp.centerX)
            make.top.equalTo(level.snp.bottom).offset(8)
        }
        role.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.width.height.equalTo(50)
        }
    }
    
    
    func configure(model: Players) {
        nick.text = model.nick
        
        if let imageUrlString = model.img, let imageUrl = URL(string: imageUrlString) {
            coverImageView.kf.setImage(with: imageUrl)
        } else {
            coverImageView.image = UIImage(named: "tima")
        }
        
        level.image = UIImage(named: "level\(model.level)") ?? UIImage(named: "level1")
        
        switch model.role {
        case 1:
            role.image = UIImage(named: "ak")
        case 2:
            role.image = UIImage(named: "awp")
        default:
            role.image = nil
        }
    }
}
