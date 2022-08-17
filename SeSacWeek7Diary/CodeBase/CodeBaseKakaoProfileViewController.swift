//
//  CodeBaseKakaoProfileViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/17.
//

import UIKit
import SnapKit

class CodeBaseKakaoProfileViewController: UIViewController {

    // MARK: - 뷰객체 Propertys
    
    // BarButtonItem
    let xButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "xmark"))
        view.tintColor = .white
        return view
    }()
    let giftButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "gift.circle"))
        view.tintColor = .white
        return view
    }()
    let diceButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "dice"))
        view.tintColor = .white
        return view
    }()
    let settingButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "gearshape.circle"))
        view.tintColor = .white
        return view
    }()
    
    // 배경 이미지
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .lightGray
        return view
    }()
    
    // 하단 버튼 3개
    let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
    let selfChatButton: UIButton = {
        let view = UIButton(type: .system)
        view.setConfiguration(title: "나와의 채팅", img: UIImage(systemName: "bubble.left.fill"), placement: .top, padding: 20)
        return view
    }()
    let editProfileButton: UIButton = {
        let view = UIButton(type: .system)
        view.setConfiguration(title: "프로필 편집", img: UIImage(systemName: "pencil"), placement: .top, padding: 20)
        return view
    }()
    let kakaoStoryButton: UIButton = {
        let view = UIButton(type: .system)
        view.setConfiguration(title: "카카오스토리", img: UIImage(systemName: "bubble.left.fill"), placement: .top, padding: 20)
        return view
    }()
    
    // 실선
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // 프로필 정보
    let profileImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "감자")
        return view
    }()
    let nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 20)
        view.text = "Dong"
        return view
    }()
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureInitialUI()
    }
    
    

    
    // MARK: - Methods
    func configureInitialUI() {
        setNavigationBar()
        addSubView()
        setSnapKitUI()
    }
    
    
    func setNavigationBar() {
        navigationItem.leftBarButtonItem = xButton
        navigationItem.rightBarButtonItems = [giftButton, diceButton, settingButton]
    }
    
    
    func addSubView() {
        // view
        [backgroundImage, bottomStackView, lineView, nameLabel, profileImage].forEach {
            view.addSubview($0)
        }
        
        // stackView
        [selfChatButton, editProfileButton, kakaoStoryButton].forEach {
            bottomStackView.addArrangedSubview($0)
        }
    }
    
    
    func setSnapKitUI() {
        backgroundImage.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(120)
        }
        
        lineView.snp.makeConstraints { make in
            make.bottom.equalTo(bottomStackView.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(1)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(lineView.snp.top).offset(-30)
            make.centerX.equalTo(view)
        }
        
        profileImage.snp.makeConstraints { make in
            make.bottom.equalTo(nameLabel.snp.top).offset(-10)
            make.width.equalTo(70)
            make.height.equalTo(70)
            make.centerX.equalTo(view)
        }
    }
}
