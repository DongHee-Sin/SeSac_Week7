//
//  ViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/16.
//

import UIKit
import SeSacUIFramwork
import SnapKit

class ViewController: UIViewController {
    
    let nameButton: UIButton = {
        let view = UIButton()
        view.setTitle("Nickname", for: .normal)
        view.backgroundColor = .black
        view.tintColor = .white
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        
        
        // Notification 데이터를 받을 준비를 미리 해둬야함 (보통 viewDidLoad 시점에 설정함)
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name(rawValue: "saveButtonNotification"), object: nil)
    }
    

    // 2. Notification
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        guard let name = notification.userInfo?["name"] as? String else { return }
        self.nameButton.setTitle(name, for: .normal)
        
        // remove해주기! Notification
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("name"), object: nil)
    }
    
    
    @objc func nameButtonClicked() {
        let vc = ProfileViewController()
        
        // 1. 클로저
        vc.saveButtonActionHandler = { value in
            self.nameButton.setTitle(value, for: .normal)
        }
        
        
        // 2. Notification 정방향 전달 : 구조가 명확해서 스니펫 사용하는것도 괜찮다!
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TEST"), object: nil, userInfo: [
            "name": "\(Int.random(in: 1...100))",
            "value": 123456
        ])
        
        
        present(vc, animated: true)
    }

    
    func configure() {
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
    }
}

