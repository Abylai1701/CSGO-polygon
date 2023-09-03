import UIKit
import SnapKit

class BotOfWeekeendCell: UITableViewCell {
    
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
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
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
        if model.imgUrl != nil {
            coverImageView.kf.setImage(with: model.imgUrl?.url)
        }
        else {
            coverImageView.image = UIImage(named: "tima")
        }
        
        if model.level == 1 {
            level.image = UIImage(named: "level1")
        }else if model.level == 2 {
            level.image = UIImage(named: "level2")
        }else if model.level == 3 {
            level.image = UIImage(named: "level3")
        }else if model.level == 4 {
            level.image = UIImage(named: "level4")
        }else if model.level == 5 {
            level.image = UIImage(named: "level5")
        }else if model.level == 6 {
            level.image = UIImage(named: "level6")
        }else if model.level == 7 {
            level.image = UIImage(named: "level7")
        }else if model.level == 8 {
            level.image = UIImage(named: "level8")
        }else if model.level == 9 {
            level.image = UIImage(named: "level9")
        }else if model.level == 10 {
            level.image = UIImage(named: "level10")
        }else{
            level.image = UIImage(named: "level1")
        }
        
        if model.role == 1 {
            role.image = UIImage(named: "ak")
        }else if model.role == 2 {
            role.image = UIImage(named: "awp")
        }
    }
}
