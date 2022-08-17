//
//  UIButton+Extension.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/17.
//

import UIKit


extension UIButton {
    
    func setConfiguration(title: String, img: UIImage?) {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.image = img
        config.imagePlacement = .top
        config.imagePadding = 20
        config.baseForegroundColor = .white
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outgoing = incoming
            outgoing.font = .systemFont(ofSize: 13)
            return outgoing
        })
        self.configuration = config
    }
    
}
