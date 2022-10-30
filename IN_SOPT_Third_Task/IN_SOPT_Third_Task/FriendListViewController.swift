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

    private let friendTopView = UIView()
    private let myProfileView = UIView()
    private let friendsScrollView = UIScrollView()

    private let friendTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
        $0.text = "친구"
    }

    private let settingIconButton = UIButton().then {
        $0.setImage(UIImage(named: "iconSetting"), for: .normal)
    }
    
    private let myProfileImageView = UIImageView(image: UIImage(named: "imageFriend"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
}

extension FriendListViewController {
    
    private func setLayout() {
        view.addSubviews(friendTopView,myProfileView,friendsScrollView)
        friendTopView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        myProfileView.snp.makeConstraints {
            $0.top.equalTo(friendTopView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(73)
        }
        friendsScrollView.snp.makeConstraints {
            $0.top.equalTo(friendTopView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        friendTopView.addSubviews(friendTextLabel, settingIconButton)
        friendTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(14)
        }
        settingIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(15)
            $0.width.height.equalTo(19)
        }
        
        myProfileView.addSubviews(myProfileImageView)
        myProfileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.leading.equalToSuperview().inset(14)
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
}
