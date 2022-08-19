//
//  ProfileViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/18.
//

import UIKit


// Notification Name을 확장해서, 타입 프로퍼티로 관리하면 점연산자로 바로 접근 가능..
extension Notification.Name {
    static let saveButton = NSNotification.Name("saveButtonNotification")
}




class ProfileViewController: UIViewController {

    let saveButton: UIButton = {
        let view = UIButton()
        view.setTitle("저장", for: .normal)
        view.backgroundColor = .black
        view.tintColor = .white
        return view
    }()
    
    let nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "이름을 입력하세요"
        view.backgroundColor = .lightGray
        view.tintColor = .white
        return view
    }()
    
    
    var saveButtonActionHandler: ((String?) -> Void)?
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        [saveButton, nameTextField].forEach {
            view.addSubview($0)
        }
        
        configure()
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        // 2. Notification 정방향 전달
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name.saveButton, object: nil)
    }
    
    
    // 값 전달 버튼 클릭!!
    @objc func saveButtonTapped() {
        
        // 1. 클로저
        //saveButtonActionHandler?(nameTextField.text)
        
        
        // 2. Notification : 구조가 명확해서 스니펫 사용하는것도 괜찮다!
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "saveButtonNotification"), object: nil, userInfo: [
            "name": nameTextField.text!,
            "value": 123456
        ])
        
        
        dismiss(animated: true)
    }
    
    
    
    // 2. Notification 정방향 전달
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        print(#function)
        guard let name = notification.userInfo?["name"] as? String else { return }
        print(name)
        self.nameTextField.text = name
    }
    
    
    
    func configure() {
        view.addSubview(saveButton)
        
        saveButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(saveButton.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
        }
    }
    
}
