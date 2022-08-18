//
//  CodeBaseAppleMusicViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit
import SnapKit

class CodeBaseAppleMusicViewController: UIViewController {

    // MARK: - 뷰객체 Propertys
    let titleLabel: UILabel = {
        let view = UILabel()
        let attributedString = NSMutableAttributedString(string: " ")
        let imageAttachment = NSTextAttachment()
        let image = UIImage(systemName: "music.note")?.withRenderingMode(.alwaysTemplate)
        
        // 이미지 설정
        imageAttachment.image = image
        
        // 이미지 크기 설정
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        // attributedString에 이미지를 append
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        
        // attributedString에 Text를 append
        attributedString.append(NSAttributedString(string: "strawberry moon"))
        
        // 뭔지 모르겠다.. 이미지 색상 변경하려고 구글링하다가 일본 커뮤니티에서 찾은 코드..
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: attributedString.length))
        
        // Label에 attributedString 설정(?)
        view.attributedText = attributedString
        
        view.textColor = .white
        return view
    }()
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        configureInitialUI()
    }
    

    
    // MARK: - Methods
    func configureInitialUI() {
        view.backgroundColor = .black
        
        setNavigationBar()
        addSubView()
        setSnapKitUI()
    }
    
    
    func setNavigationBar() {
        
    }
    
    
    func addSubView() {
        [titleLabel].forEach {
            view.addSubview($0)
        }
    }
    
    
    func setSnapKitUI() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
    
}
