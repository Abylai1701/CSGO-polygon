import Foundation
import UIKit

class CodeView: UIView {
    weak var delegate: CodeSelectDelegate?
    lazy var firstInputView : UITextField = {
        var text = UITextField()
        text.textColor = .white
        text.backgroundColor = .bottomColor
        text.layer.cornerRadius = 16
        text.keyboardType = .numberPad
        text.layer.borderWidth = 1
        text.delegate = self
        text.textAlignment = .center
        text.layer.borderColor = UIColor.borderColor.cgColor
        text.font = .airbnbCerealWBd(ofSize: 24)
        text.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        
        return text
    }()
    var onFourthInputViewChange : (()->())?
    
    lazy var secondInputView : UITextField = {
        var text = UITextField()
        text.textColor = .white
        text.backgroundColor = .bottomColor
        text.layer.cornerRadius = 16
        text.delegate = self
        text.layer.borderWidth = 1
        text.keyboardType = .numberPad
        text.layer.borderColor = UIColor.borderColor.cgColor
        text.textAlignment = .center
        text.font = .airbnbCerealWBd(ofSize: 24)
        text.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        
        return text
    }()
    lazy var thirdInputView : UITextField = {
        var text = UITextField()
        text.textColor = .white
        text.backgroundColor = .bottomColor
        text.layer.cornerRadius = 16
        text.delegate = self
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.borderColor.cgColor
        text.keyboardType = .numberPad
        text.textAlignment = .center
        text.font = .airbnbCerealWBd(ofSize: 24)
        text.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        
        return text
    }()
    lazy var fourthInputView : UITextField = {
        var text = UITextField()
        text.textColor = .white
        text.backgroundColor = .bottomColor
        text.layer.cornerRadius = 16
        text.delegate = self
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.borderColor.cgColor
        text.keyboardType = .numberPad
        text.textAlignment = .center
        text.font = .airbnbCerealWBd(ofSize: 24)
        text.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        text.delegate = self
        
        return text
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        setupViews()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        addSubview(firstInputView)
        firstInputView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalTo(82)
            make.height.equalTo(59)
        }
        addSubview(secondInputView)
        secondInputView.snp.makeConstraints { (make) in
            make.top.width.height.equalTo(firstInputView)
            make.left.equalTo(firstInputView.snp.right).offset(8)
        }
        addSubview(thirdInputView)
        thirdInputView.snp.makeConstraints { (make) in
            make.top.width.height.equalTo(firstInputView)
            make.left.equalTo(secondInputView.snp.right).offset(8)
        }
        addSubview(fourthInputView)
        fourthInputView.snp.makeConstraints { (make) in
            make.top.width.height.equalTo(firstInputView)
            make.left.equalTo(thirdInputView.snp.right).offset(8)
            make.right.equalToSuperview()
        }
    }
    @objc func textFieldDidChange(textField: UITextField) {
        let text = textField.text
        if text?.count == 1 {
            switch textField {
            case firstInputView:
                secondInputView.becomeFirstResponder()
            case secondInputView:
                thirdInputView.becomeFirstResponder()
            case thirdInputView:
                fourthInputView.becomeFirstResponder()
            case fourthInputView:
                fourthInputView.resignFirstResponder()
                delegate?.selectCode()
            default:
                break
            }
        }
        if text?.count == 0 {
            switch textField {
            case secondInputView:
                firstInputView.becomeFirstResponder()
            case thirdInputView:
                secondInputView.becomeFirstResponder()
            case fourthInputView:
                thirdInputView.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
}


extension CodeView : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onFourthInputViewChange?()
        textField.layer.borderColor = UIColor.borderColor.cgColor
        textField.backgroundColor = .bottomColor
    }
    
}
protocol CodeSelectDelegate: AnyObject {
    func selectCode()
}
extension CodeView: UITextViewDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.blueColor.cgColor
        textField.backgroundColor = .phioletColor
    }
}
