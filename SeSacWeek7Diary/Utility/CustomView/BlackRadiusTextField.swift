//
//  BlackRadiusTextField.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit

/*
 라이브러리 만들때도 이렇게 상속 구조를 많이 사용함
 공통된 부분을 갖는 뷰객체들도 커스텀 클래스로 만들어두고 사용하면 좋다!
 */


class BlackRadiusTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        // self 생략
        backgroundColor = .clear
        textAlignment = .center
        borderStyle = .none
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        font = .boldSystemFont(ofSize: 15)
    }
    
}
