//
//  FriendListViewController.swift
//  IN_SOPT_Second_Task
//
//  Created by 박의서 on 2022/10/12.
//

import UIKit
import SnapKit

class FriendListViewController: UIViewController {
    
    var name: String?

    private let friendsScrollView = UIScrollView()
    
    private let topBarView = UIView()

    private let friendTextLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "친구"
        return label
    }()
    
    private let settingIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settings 1"), for: .normal)
        return button
    }()
    
    private lazy var profileIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile_userImg"), for: .normal)
        button.addTarget(self, action: #selector(presentToProfileVC), for: .touchUpInside)
        return button
    }()
    
    private func setLayout() {
        view.addSubviews(topBarView,friendsScrollView)
        
        topBarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(52)
        }
        
        friendsScrollView.snp.makeConstraints { make in
            make.top.equalTo(topBarView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        topBarView.addSubviews(friendTextLabel, settingIconButton)
        
        friendTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(14)
        }
        
        settingIconButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(friendTextLabel.snp.trailing).offset(4)
            make.width.height.equalTo(21)
        }
        
        friendsScrollView.addSubviews(profileIconButton)
        
        profileIconButton.snp.makeConstraints { make in
            make.top.equalTo(topBarView.snp.bottom).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(14)
            make.width.equalTo(59)
            make.height.equalTo(58)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    @objc
    private func presentToProfileVC() {
        let profileVC = KakaoProfileViewController()
        profileVC.modalPresentationStyle = .fullScreen
        
        if let userName = name {
            profileVC.dataBind(userName: userName)
        }
        self.present(profileVC, animated: true, completion: nil)
    }
    
    func dataBind(userName: String) {
            name = userName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
}
