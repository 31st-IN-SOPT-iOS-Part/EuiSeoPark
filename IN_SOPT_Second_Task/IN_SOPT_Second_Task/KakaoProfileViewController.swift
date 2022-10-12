//
//  KakaoProfileViewController.swift
//  IN_SOPT_Second_Task
//
//  Created by 박의서 on 2022/10/12.
//

import UIKit

class KakaoProfileViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile_closeBtn"), for: .normal)
        button.addTarget(self, action: #selector(touchUpCloseButton), for: .touchUpInside)
        return button
    }()
    
    private func layout() {
        view.addSubviews(closeButton)
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
    }
    
    @objc
    private func touchUpCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        layout()
    }
    
    
}
