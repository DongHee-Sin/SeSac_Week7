//
//  WriteViewController.swift
//  SeSacWeek7Diary
//
//  Created by 신동희 on 2022/08/19.
//

import UIKit
import SnapKit

class WriteViewController: BaseViewController {
    
    var mainView = WriteView()
    
    // viewDidLoad보다 먼저 호출
    override func loadView() {
        self.view = mainView
    }
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // MARK: - Methods
    override func configure() {
        // 커스텀한 뷰에 직접 접근하여 요소에 Action을 부여하는 등 처리가 가능
        // mainView.titleTextField
        
        // 뷰컨의 루트뷰(view)는 타입이 UIView로 정의되어 있음 (업캐스팅된 상태)
        // 따라서 view로 바로 접근하면 커스텀 뷰의 멤버에는 접근할 수 없음 (타입캐스팅을 하면 가능하지만, 굳이?)
        // view.titleTextField  (접근불가)
        
        
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldTapped(_:)), for: .editingDidEndOnExit)
    }
    
    
    // 매개변수로 뷰객체를 가져올 수 있다. (addTarget)
    // 어떻게 매개변수를 받아올 수 있는건가? -> 찾아보기
    @objc func titleTextFieldTapped(_ textField: UITextField) {
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해주세요", button: "확인")
            return
        }
        
    }
}
