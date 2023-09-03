import UIKit

class BaseButton: UIButton {
    
    required init?(coder: NSCoder) {fatalError("")}
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 30
        backgroundColor = .blueColor
        titleLabel?.font = .airbnbCerealWBd(ofSize: 16)
    }
    
}
