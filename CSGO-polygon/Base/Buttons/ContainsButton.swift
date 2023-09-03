import UIKit

class ContainsButton: UIButton {
    
    required init?(coder: NSCoder) {fatalError("")}
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("Contains a number", for: .normal)
        setImage(UIImage(named: "unchecked_icon")?.withRenderingMode(.alwaysTemplate), for: .normal)
        imageEdgeInsets = UIEdgeInsets(
                    top: 0,
                    left: -9,
                    bottom: 0,
                    right: 0
                )
    }
    
}
