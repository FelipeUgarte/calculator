//
//  ButtonFormatter.swift
//  calculator
//
//  Created by Felipe Ugarte on 05-04-22.
//

import UIKit

class ButtonFormatter1: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.00)
        layer.cornerRadius = 20.0
        contentHorizontalAlignment = .center
        tintColor = .white
    }
}

class ButtonFormatter2: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 0.88, green: 0.54, blue: 0.18, alpha: 1.00)
        layer.cornerRadius = 20.0
        contentHorizontalAlignment = .center
        tintColor = .white
    }
}

class ButtonFormatter3: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1.00)
        layer.cornerRadius = 20.0
        contentHorizontalAlignment = .center
        tintColor = .black
    }
}

class TotalLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .black
        layer.cornerRadius = 20.0
        textAlignment = .right
        textColor = .white
        numberOfLines = 1
        adjustsFontSizeToFitWidth = true
    }
}

class OperatorLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .black
        layer.cornerRadius = 20.0
        textAlignment = .right
        textColor = .white
        numberOfLines = 0
        
    }
}
