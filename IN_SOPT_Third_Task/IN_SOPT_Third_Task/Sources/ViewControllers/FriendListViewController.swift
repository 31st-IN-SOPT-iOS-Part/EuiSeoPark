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

    private lazy var settingIconButton = UIButton().then {
        $0.setImage(UIImage(named: "iconSetting"), for: .normal)
        $0.addTarget(self, action: #selector(touchUpSettingButton), for: .touchUpInside)
    }
    
    private lazy var myProfileButton = UIButton().then {
        $0.setImage(UIImage(named: "profile_userImg"), for: .normal)
        $0.addTarget(self, action: #selector(presentToProfileVC), for: .touchUpInside)
    }
    
    private let kakaoProfileTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false // 아직 이걸 왜 한느지 모르겠다.
    }
    
    var kakaoProfileList: [KakaoProfile] = [
        KakaoProfile(profileImage: "profileImage1", name: "솝트", statusMessage: "사랑해"),
        KakaoProfile(profileImage: "profileImage2", name: "솝트", statusMessage: "사랑해"),
        KakaoProfile(profileImage: "profileImage3", name: "솝트", statusMessage: "사랑해"),
        KakaoProfile(profileImage: "profileImage4", name: "솝트", statusMessage: "사랑해"),
        KakaoProfile(profileImage: "profileImage5", name: "솝트", statusMessage: "사랑해"),
        KakaoProfile(profileImage: "profileImage6", name: "솝트", statusMessage: "사랑해"),
        KakaoProfile(profileImage: "profileImage7", name: "솝트", statusMessage: "사랑해"),
        KakaoProfile(profileImage: "profileImage8", name: "솝트", statusMessage: "사랑해"),
        KakaoProfile(profileImage: "profileImage9", name: "솝트", statusMessage: "사랑해")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

extension FriendListViewController {
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubviews(friendTopView,myProfileView,kakaoProfileTableView)
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
//
//        friendsScrollView.addSubviews(myProfileButton)
//        myProfileButton.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(7)
//            $0.leading.equalToSuperview().inset(14)
//            $0.width.equalTo(59)
//            $0.height.equalTo(58)
//            $0.bottom.equalToSuperview().inset(10)
//        }
        kakaoProfileTableView.snp.makeConstraints {
            $0.top.equalTo(friendTopView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50 * kakaoProfileList.count)
        }
    }
    
    @objc
    private func touchUpSettingButton() {
        print("You touched setting icon")
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
