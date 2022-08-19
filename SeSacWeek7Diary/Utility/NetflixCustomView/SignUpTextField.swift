//
//  SignUpTextField.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit

class SignUpTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        backgroundColor = .darkGray
        borderStyle = .roundedRect
        textColor = .white
        font = .systemFont(ofSize: 15)
        textAlignment = .center
    }
}
