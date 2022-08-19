//
//  BaseView.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit

class BaseView: UIView {
    
    // 코드 베이스로 만들었을 때 호출
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setConstraints()
    }
    
    // xib(storyboard)로 만들었을 때 호출
    // 실패가능 생성자 (호출되지 않을 수 있다는 뜻 => 코드베이스로 만들어진 경우)
    required init?(coder: NSCoder) {
        // 만나면 런타임 오류 (반환값이 Never Type)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() { }
    
    func setConstraints() { }
}








// =============================================

// required initializer
protocol Example {
    init(name: String)
}


class Mobile: Example {
    let name: String
    
    required init(name: String) {
        self.name = name
    }
}


class Apple: Mobile {
    let wwdc: String
    
    init(wwdc: String) {
        self.wwdc = wwdc
        super.init(name: "모바일")
    }
    
    // 앞에 키워드를 통해 상위 클래스에서 온 이니셜라이저인지, 프로토콜에 정의된 이니셜라이저인지 확인 가능
    required init(name: String) {
        fatalError()  // 만나면 무조건 런타임 오류 (
    }
}


let a = Apple(wwdc: "애플")
