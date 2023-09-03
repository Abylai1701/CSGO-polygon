//
//  CodeAgainLabel.swift
//  madiyarProject
//
//  Created by Bauyrzhan on 04.06.2021.
//

import Foundation
import UIKit

class NotAccountButton: UIButton {
    
    required init?(coder: NSCoder) {fatalError("")}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setText() {
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.airbnbCerealWLt(ofSize: 14)]
        
        let secondAttributes : [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.blueColor, NSAttributedString.Key.font: UIFont.airbnbCerealWLt(ofSize: 14)]
        
        let firstString = NSMutableAttributedString(string: "У вас нет аккаунта?", attributes: firstAttributes)
        let secondString = NSAttributedString(string: " Создать", attributes: secondAttributes)
        
        firstString.append(secondString)
        
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        print(firstString)
        
        setAttributedTitle(firstString, for: .normal)
    }
    func setCodeText() {
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.airbnbCerealWLt(ofSize: 14)]
        
        let secondAttributes : [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.blueColor, NSAttributedString.Key.font: UIFont.airbnbCerealWLt(ofSize: 14)]
        
        let firstString = NSMutableAttributedString(string: "Мне не пришло сообщение с кодом. ", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "Отправить ещё раз", attributes: secondAttributes)
        
        firstString.append(secondString)
        
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        print(firstString)
        
        setAttributedTitle(firstString, for: .normal)
    }
    func setRegisterText() {
        let firstAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.airbnbCerealWLt(ofSize: 14)]
        
        let secondAttributes : [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.blueColor, NSAttributedString.Key.font: UIFont.airbnbCerealWLt(ofSize: 14)]
        
        let firstString = NSMutableAttributedString(string: "Нажимая кнопку Создать, вы соглашаетесь ", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "с политикой конфеденциальности и правилами пользования.", attributes: secondAttributes)
        
        firstString.append(secondString)
        
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        print(firstString)
        
        setAttributedTitle(firstString, for: .normal)
    }
}

