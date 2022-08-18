//
//  ProfileViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/18.
//

import UIKit

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
    
    
    var saveButtonActionHandler: (() -> Void)?
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        [saveButton, nameTextField].forEach {
            view.addSubview($0)
        }
        
        configure()
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func saveButtonTapped() {
        
        // 값 전달 기능 실행 => 클로저 구문 활용
        saveButtonActionHandler?()
        
        dismiss(animated: true)
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
