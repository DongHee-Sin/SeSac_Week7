//
//  NetflixView.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit

class NetflixView: BaseView {
    
    // MARK: - 뷰객체
    
    // 배경색 지정을 위한 UIView : self.backgroundColor가 동작하지 않는다... 왜??!!?!?
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    // 메인 포스터 이미지
    let mainPosterImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "태극기휘날리며")
        view.contentMode = .scaleToFill
        return view
    }()
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.contentMode = .scaleToFill
        return view
    }()
    
    
    // 상단 스택뷰
    let navigationStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 24
        view.backgroundColor = .clear
        return view
    }()
    
    let netflixLogoButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont.systemFont(ofSize: 45, weight: .heavy)
        view.setTitle("N", for: .normal)
        view.tintColor = .white
        return view
    }()
    
    let tvprogramButton: WhiteTextButton = {
        let view = WhiteTextButton()
        view.setTitle("TV 프로그램", for: .normal)
        return view
    }()
    
    let movieButton: WhiteTextButton = {
        let view = WhiteTextButton()
        view.setTitle("영화", for: .normal)
        return view
    }()
    
    let naviMyFavoriteButton: WhiteTextButton = {
        let view = WhiteTextButton()
        view.setTitle("내가 찜한 콘텐츠", for: .normal)
        return view
    }()
    
    
    // 하단 스택뷰
    let mediaStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.spacing = 10
        view.backgroundColor = .clear
        return view
    }()
    
    let myFavoriteButton: UIButton = {
        let view = UIButton()
        view.setConfiguration(title: "내가 찜한 컨텐츠", img: UIImage(named: "check"), placement: .top, padding: 10)
        return view
    }()
    
    let playButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "play_normal"), for: .normal)
        view.setImage(UIImage(named: "play_highlighted"), for: .highlighted)
        return view
    }()
    
    let infoButton: UIButton = {
        let view = UIButton()
        view.setConfiguration(title: "정보", img: UIImage(named: "info"), placement: .top, padding: 10)
        return view
    }()
    
    
    // 미리보기 Label + 스택뷰
    let previewLabel: UILabel = {
        let view = UILabel()
        view.text = "미리보기"
        view.font = .boldSystemFont(ofSize: 17)
        view.textColor = .white
        view.backgroundColor = .clear
        return view
    }()
    
    let previewStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.spacing = 8
        view.backgroundColor = .clear
        return view
    }()
    
    let previewPosterView1: CircleImageView = {
        let view = CircleImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.image = UIImage(named: "택시운전사")
        return view
    }()
    
    let previewPosterView2: CircleImageView = {
        let view = CircleImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.image = UIImage(named: "왕의남자")
        return view
    }()
    
    let previewPosterView3: CircleImageView = {
        let view = CircleImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.image = UIImage(named: "7번방의선물")
        return view
    }()
    
    
    
    // MARK: - Methods
    override func configureUI() {
        [backgroundView, mainPosterImageView, backgroundImage, navigationStackView, mediaStackView, previewLabel, previewStackView].forEach {
            self.addSubview($0)
        }
        
        [netflixLogoButton, tvprogramButton, movieButton, naviMyFavoriteButton].forEach {
            navigationStackView.addArrangedSubview($0)
        }
        
        [myFavoriteButton, playButton, infoButton].forEach {
            mediaStackView.addArrangedSubview($0)
        }
        
        [previewPosterView1, previewPosterView2, previewPosterView3].forEach {
            previewStackView.addArrangedSubview($0)
        }
    }
    

    override func setConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(0)
        }
        
        mainPosterImageView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(mainPosterImageView.snp.width).multipliedBy(1.5)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(mainPosterImageView).inset(0)
        }
        
        navigationStackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(self).offset(8)
            make.trailing.lessThanOrEqualTo(self).offset(-8)
        }
        
        mediaStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(backgroundImage.snp.bottom).offset(-16)
            make.height.equalTo(40)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(8)
            make.trailing.lessThanOrEqualTo(self).offset(-8)
        }
        
        previewStackView.snp.makeConstraints { make in
            make.top.equalTo(previewLabel.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(8)
            make.trailing.equalTo(self).offset(-8)
            make.height.equalTo((UIScreen.main.bounds.width - 24) / 3)
        }
        
        [previewPosterView1, previewPosterView2, previewPosterView3].forEach {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = (UIScreen.main.bounds.width - 24) / 6
        }
    }
}
