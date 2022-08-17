//
//  CodeBaseBeminViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/17.
//

import UIKit
import SnapKit


class CodeBaseBeminViewController: UIViewController {

    // MARK: - 뷰객체 Propertys
    
    // 네비게이션바
    let naviTitleBarButton: UIButton = {
        let view = UIButton(type: .system)
        view.setConfiguration(title: "회사", img: UIImage(systemName: "chevron.down"), placement: .trailing, padding: 10, fontSize: 17)
        return view
    }()
    let menuBarButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "square.grid.2x2"))
        view.tintColor = .white
        return view
    }()
    let bellBarButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "bell"))
        view.tintColor = .white
        return view
    }()
    let faceBarButton: UIBarButtonItem = {
        let view = UIBarButtonItem(image: UIImage(systemName: "face.smiling"))
        view.tintColor = .white
        return view
    }()
    
    // 서치바
    let textFieldBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    let textFieldInnerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowPath = nil
        return view
    }()
    let searchButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        view.tintColor = .systemMint
        return view
    }()
    let textField: UITextField = {
        let view = UITextField()
        view.placeholder = "포케? 돈까스? 커리?"
        view.textColor = .darkGray
        view.font = UIFont.systemFont(ofSize: 15)
        return view
    }()
    
    // 메인 그리드 뷰
    let deliveryImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "delivery")
        return view
    }()
    let bemin1ImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "baemin1")
        return view
    }()
    let baeminstoreImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "baeminstore")
        return view
    }()
    let bannerImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "main_banner")
        return view
    }()
    let takeoutImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "takeout")
        return view
    }()
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        configureInitialUI()
    }
    

    
    // MARK: - Methods
    func configureInitialUI() {
        view.backgroundColor = .white
        
        setNavigationBar()
        addSubView()
        setSnapKitUI()
    }
    
    
    func setNavigationBar() {
        navigationItem.titleView = naviTitleBarButton
        navigationItem.leftBarButtonItem = menuBarButton
        navigationItem.rightBarButtonItems = [bellBarButton, faceBarButton]
        
        navigationController?.navigationBar.backgroundColor = .systemMint
    }
    
    
    func addSubView() {
        [textFieldBackgroundView, textFieldInnerView, searchButton, textField, deliveryImageView, bemin1ImageView, baeminstoreImageView, bannerImageView, takeoutImageView].forEach {
            view.addSubview($0)
        }
    }
    
    
    func setSnapKitUI() {
        textFieldBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(80)
        }
        
        textFieldInnerView.snp.makeConstraints { make in
            make.edges.equalTo(textFieldBackgroundView).inset(16)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldInnerView.snp.top).offset(10)
            make.leading.equalTo(textFieldInnerView.snp.leading).offset(10)
            make.bottom.equalTo(textFieldInnerView.snp.bottom).offset(-10)
            make.width.equalTo(searchButton.snp.height)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(textFieldInnerView.snp.top).offset(10)
            make.leading.equalTo(searchButton.snp.trailing).offset(10)
            make.trailing.equalTo(textFieldInnerView.snp.trailing).offset(-10)
            make.bottom.equalTo(textFieldInnerView.snp.bottom).offset(-10)
        }
        
        deliveryImageView.snp.makeConstraints { make in
            make.top.equalTo(textFieldBackgroundView.snp.bottom).offset(16)
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(bemin1ImageView.snp.leading).offset(-16)
            make.width.equalTo(bemin1ImageView.snp.width)
            make.height.equalTo(deliveryImageView.snp.width)
        }
        
        bemin1ImageView.snp.makeConstraints { make in
            make.top.equalTo(textFieldBackgroundView.snp.bottom).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.height.equalTo(deliveryImageView.snp.width)
        }
        
        baeminstoreImageView.snp.makeConstraints { make in
            make.top.equalTo(bemin1ImageView.snp.bottom).offset(16)
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.height.equalTo(baeminstoreImageView.snp.width).multipliedBy(0.25)
        }
        
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(baeminstoreImageView.snp.bottom).offset(16)
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.height.equalTo(baeminstoreImageView.snp.width).multipliedBy(0.25)
        }
        
        takeoutImageView.snp.makeConstraints { make in
            make.top.equalTo(bannerImageView.snp.bottom).offset(16)
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.height.equalTo(baeminstoreImageView.snp.width).multipliedBy(0.25)
        }
    }
}
