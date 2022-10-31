//
//  PhotoGridViewController.swift
//  IN_SOPT_Third_Task
//
//  Created by 박의서 on 2022/10/30.
//

import UIKit

class PhotoGridViewController: UIViewController {
    
    private let chatTopView = UIView()

    private let chatTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
        $0.text = "채팅"
    }
    
    private let openChatTextLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
        $0.text = "오픈채팅"
    }
    
    private lazy var moreButton = UIButton().then {
        $0.setImage(UIImage(named: "iconPlus"), for: .normal)
        $0.addTarget(self, action: #selector(presentToMoreVC), for: .touchUpInside)
    }
    
    private lazy var settingIconButton = UIButton().then {
        $0.setImage(UIImage(named: "iconSetting"), for: .normal)
        $0.addTarget(self, action: #selector(touchUpSettingButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

extension PhotoGridViewController {
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubviews(chatTopView)
        chatTopView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        
        chatTopView.addSubviews(chatTextLabel, openChatTextLabel, moreButton, settingIconButton)
        chatTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(14)
        }
        openChatTextLabel.snp.makeConstraints {
            $0.top.equalTo(chatTextLabel)
            $0.leading.equalTo(chatTextLabel.snp.trailing).offset(7)
        }
        settingIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.height.equalTo(19)
        }
        moreButton.snp.makeConstraints {
            $0.top.equalTo(settingIconButton)
            $0.trailing.equalTo(settingIconButton.snp.leading).offset(-12)
            $0.width.height.equalTo(19)
        }
    }
    
    @objc
    private func touchUpSettingButton() {
        print("You touched setting icon")
    }
    
    @objc
    private func touchUpMoreButton() {
        print("You touched more view icon")
    }
    
    @objc
    private func presentToMoreVC() {
        let moreVC = MoreViewController()
        moreVC.modalPresentationStyle = .fullScreen
        self.present(moreVC, animated: true, completion: nil)
    }
}
