//
//  WhiteTextButton.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit

class WhiteTextButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        tintColor = .white
        titleLabel?.font = .boldSystemFont(ofSize: 15)
    }

}
