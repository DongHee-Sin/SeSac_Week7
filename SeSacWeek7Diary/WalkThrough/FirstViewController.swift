//
//  FirstViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tutorialLabel: UILabel!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var testImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testImage.image = UIImage(systemName: "star.fill")
        
        tutorialLabel.numberOfLines = 0
        tutorialLabel.alpha = 0
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.backgroundColor = .red
        tutorialLabel.text = """
        일기 씁시다!
        잘 써봅시다!
        """
        
        blackView.backgroundColor = .black
        blackView.alpha = 0
        
        
        UIView.animate(withDuration: 3) {
            // n초 동안 진행할 작업
            self.tutorialLabel.alpha = 1
            self.tutorialLabel.backgroundColor = .yellow
        } completion: { _ in
            // animation이 끝나면 실행할 작업
            self.animateBlackView()
        }
        
        animateImageView()

    }
    
    
    func animateBlackView() {
        UIView.animate(withDuration: 1) {
            self.blackView.transform = CGAffineTransform(scaleX: 3, y: 0.5)
            self.blackView.alpha = 1
        } completion: { _ in
            print("complete")
        }

    }
    
    
    func animateImageView() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.testImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }

    }
    
}
