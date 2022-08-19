//
//  BaseViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 아래 2개의 메서드를 자동 호출 (상속받는 부분에서 호출하지 않아도 된다!)
        configure()
    }
    
    
    func configure() {}
    
    func showAlertMessage(title: String, button: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: button, style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
