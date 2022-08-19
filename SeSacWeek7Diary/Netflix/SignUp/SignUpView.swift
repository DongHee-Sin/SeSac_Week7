//
//  SignUpView.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit
import SnapKit

class SignUpView: BaseView {
    
    // MARK: - 뷰객체
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "DONGFLIX"
        view.textColor = .red
        view.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        view.textAlignment = .center
        return view
    }()
    
    let textFieldStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()
    
    let emailTextField: SignUpTextField = {
        let view = SignUpTextField()
        view.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return view
    }()
    
    let passwordTextField: SignUpTextField = {
        let view = SignUpTextField()
        view.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return view
    }()
    
    let nicknameTextField: SignUpTextField = {
        let view = SignUpTextField()
        view.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return view
    }()
    
    let locationTextField: SignUpTextField = {
        let view = SignUpTextField()
        view.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return view
    }()
    
    let codeTextField: SignUpTextField = {
        let view = SignUpTextField()
        view.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return view
    }()
    
    let signupButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = .white
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = .boldSystemFont(ofSize: 17)
        view.layer.cornerRadius = 10
        view.setTitle("회원가입", for: .normal)
        return view
    }()
    
    let enterEdditionalInfoLabel: UILabel = {
        let view = UILabel()
        view.text = "추가 정보 입력"
        view.textColor = .white
        view.font = .systemFont(ofSize: 17)
        return view
    }()
    
    let edditionalInfoSwitch: UISwitch = {
        let view = UISwitch()
        view.onTintColor = .red
        view.thumbTintColor = .white
        view.backgroundColor = .darkGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 15.5
        view.isOn = true
        return view
    }()
    
    
    
    
    // MARK: - Methods
    override func configureUI() {
        self.backgroundColor = .black
        
        [backgroundView, titleLabel, textFieldStackView, signupButton, enterEdditionalInfoLabel, edditionalInfoSwitch].forEach {
            self.addSubview($0)
        }
        
        [emailTextField, passwordTextField, nicknameTextField, locationTextField, codeTextField].forEach {
            textFieldStackView.addArrangedSubview($0)
        }
    }
    
    
    override func setConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self).offset(30)
            make.trailing.equalTo(self).offset(-30)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
            make.leading.equalTo(self).offset(30)
            make.trailing.equalTo(self).offset(-30)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldStackView.snp.bottom).offset(12)
            make.leading.equalTo(self).offset(30)
            make.trailing.equalTo(self).offset(-30)
            make.height.equalTo(50)
        }
        
        enterEdditionalInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(signupButton.snp.bottom).offset(20)
            make.leading.equalTo(self).offset(30)
            make.trailing.lessThanOrEqualTo(-30)
        }
        
        edditionalInfoSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(enterEdditionalInfoLabel)
            make.trailing.equalTo(self).offset(-30)
        }
    }
}
