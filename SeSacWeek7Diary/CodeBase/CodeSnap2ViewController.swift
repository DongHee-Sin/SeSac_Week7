//
//  CodeSnap2ViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/17.
//

import UIKit

class CodeSnap2ViewController: UIViewController {

    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [redView, blackView].forEach {
            view.addSubview($0)
        }
        blackView.addSubview(yellowView)  // containerView, stackView는 addSubview가 아닌 다른 메서드를 사용
        
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view)
        }
        
        blackView.snp.makeConstraints { make in
            //make.edges.equalTo(redView).offset(50)   // 모든 edge에 대해 offset만큼 이동
            //make.edges.equalTo(redView).inset(50)    // 모든 edge에 대해 안쪽으로 offset만큼 이동
            
            
        }
    }
    

}
