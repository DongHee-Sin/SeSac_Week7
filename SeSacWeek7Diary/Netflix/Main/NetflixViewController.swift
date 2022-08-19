//
//  NetflixViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit


class NetflixViewController: BaseViewController {

    
    // loadView
    let netflixView = NetflixView()
    
    override func loadView() {
        self.view = netflixView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
