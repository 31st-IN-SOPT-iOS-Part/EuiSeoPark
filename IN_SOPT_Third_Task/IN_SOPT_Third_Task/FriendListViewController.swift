//
//  FriendListViewController.swift
//  IN_SOPT_Second_Task
//
//  Created by 박의서 on 2022/10/12.
//

import UIKit
import SnapKit
import Then

final class FriendListViewController: UIViewController {
    
    var name: String?

    private let friendsScrollView = UIScrollView()
    
    private let topBarView = UIView()

    private let friendTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
        $0.text = "친구"
    }
    
    private let settingIconButton = UIButton().then {
        $0.setImage(UIImage(named: "settings 1"), for: .normal)
    }
    
    private lazy var profileIconButton = UIButton().then {
        $0.setImage(UIImage(named: "profile_userImg"), for: .normal)
        $0.addTarget(self, action: #selector(presentToProfileVC), for: .touchUpInside)
    }
    
    private func setLayout() {
        view.addSubviews(topBarView,friendsScrollView)
        
        topBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        friendsScrollView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        topBarView.addSubviews(friendTextLabel, settingIconButton)
        
        friendTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(14)
        }
        
        settingIconButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.leading.equalTo(friendTextLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(21)
        }
        
        friendsScrollView.addSubviews(profileIconButton)
        
        profileIconButton.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom).offset(15)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(14)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
            $0.bottom.equalToSuperview().inset(10)
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
