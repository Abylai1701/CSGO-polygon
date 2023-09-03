import UIKit

class SecondaryButton: UIButton {
    
    required init?(coder: NSCoder) {fatalError("")}
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 24
        backgroundColor = .white
        layer.borderWidth = 2
        titleLabel?.font = .airbnbCerealWBd(ofSize: 16)
    }
    
}
