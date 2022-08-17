//
//  ViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/16.
//

import UIKit

import SeSacUIFramwork


class ViewController: UIViewController {

    var name = "고래밥"
    
    var age = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let vc = CodeBaseKakaoProfileViewController()
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .overFullScreen
        present(navi, animated: true)
        
        
//        testOpen()
        
//        showSesacAlert(title: "TestAlert", message: "Test Massage", buttonTitle: "Save") { _ in
//            self.view.backgroundColor = .lightGray
//        }
        
//        let img = UIImage(systemName: "star.fill")!
//        let shareURL = "https://www.apple.com"
//        let text = "WWDC What's New!"
//        sesacShowActivityViewController(shareImage: img, shareURL: shareURL, shareText: text)
        
        OpenWebView.presentWebViewController(self, url: "https://naver.com", transitionStyle: .present)
        
    }

    
    // objc???
//    override func testOpen() {
//        super.testOpen()
//    }
}

