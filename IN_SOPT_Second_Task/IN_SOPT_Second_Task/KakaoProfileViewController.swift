//
//  KakaoProfileViewController.swift
//  IN_SOPT_Second_Task
//
//  Created by 박의서 on 2022/10/12.
//

import UIKit
import SnapKit
import Then

final class KakaoProfileViewController: UIViewController {
    
    // MARK: - Profile
    
    private lazy var closeButton = UIButton().then {
        $0.setImage(UIImage(named: "profile_closeBtn"), for: .normal)
        $0.addTarget(self, action: #selector(touchUpCloseButton), for: .touchUpInside)
    }
    
    private lazy var profileIconButton = UIButton().then {
        $0.setImage(UIImage(named: "profile_userImg"), for: .normal)
    }
    
    private let userNameTextLabel = UILabel().then {
        $0.text = "김솝트"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 15)
    }
    
    // MARK: - Bottom Button StackView
    private let chatIconImage = UIImageView().then {
        $0.image = UIImage(named: "profileTalkImg")
    }
    
    private let chatTextLabel = UILabel().then {
        $0.text = "나와의 채팅"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 10)
    }
    
    private let editProfileImage = UIImageView().then {
        $0.image = UIImage(named: "profile_editImg")
    }
    
    private let editProfileTextLabel = UILabel().then {
        $0.text = "프로필 편집"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 10)
    }
    
    private let kakaoStoryImage = UIImageView().then {
        $0.image = UIImage(named: "profileStoryImg")
    }
    
    private let kakaoStoryTextLabel = UILabel().then {
        $0.text = "카카오스토리"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 10)
    }
    
    private lazy var chatView = UIView().then {
        let touchGesture = UITapGestureRecognizer(target: self, action:  #selector(touchUpChatView))
        $0.addGestureRecognizer(touchGesture)
    }
    
    private lazy var editProfileView = UIView().then {
        let touchGesture = UITapGestureRecognizer(target: self, action:  #selector(touchUpEditProfileView))
        $0.addGestureRecognizer(touchGesture)
    }
    
    private lazy var kakaoStoryView = UIView().then {
        let touchGesture = UITapGestureRecognizer(target: self, action:  #selector(touchUpKakaoStoryView))
        $0.addGestureRecognizer(touchGesture)
    }
    
    // MARK: - line
    private let seperateLine = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    // MARK: - layout
    private func setLayout() {
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [chatView, editProfileView, kakaoStoryView])
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .equalSpacing
            stackView.spacing = 8
            return stackView
        }()
        
        view.addSubviews(closeButton, profileIconButton, userNameTextLabel, seperateLine, stackView)
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(14)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            $0.width.equalTo(13)
            $0.height.equalTo(14)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(44)
            $0.bottom.equalToSuperview().inset(47)
            $0.height.equalTo(72)
        }
        
        chatView.addSubviews(chatIconImage, chatTextLabel)
        chatIconImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalToSuperview().inset(39)
            $0.trailing.equalToSuperview().inset(32)
            $0.width.equalTo(19)
            $0.height.equalTo(18)
        }
        chatTextLabel.snp.makeConstraints {
            $0.top.equalTo(chatIconImage.snp.bottom).offset(8)
            $0.centerX.equalTo(chatIconImage)
        }
        
        editProfileView.addSubviews(editProfileImage, editProfileTextLabel)
        editProfileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(39)
            $0.trailing.equalToSuperview().inset(39)
            $0.width.equalTo(18)
            $0.height.equalTo(19)
        }
        editProfileTextLabel.snp.makeConstraints {
            $0.top.equalTo(editProfileImage.snp.bottom).offset(10)
            $0.centerX.equalTo(editProfileImage)
        }
        
        kakaoStoryView.addSubviews(kakaoStoryImage, kakaoStoryTextLabel)
        kakaoStoryImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(39)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(18)
            $0.height.equalTo(19)
        }
        kakaoStoryTextLabel.snp.makeConstraints {
            $0.top.equalTo(kakaoStoryImage.snp.bottom).offset(10)
            $0.centerX.equalTo(kakaoStoryImage)
        }
        
        seperateLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(stackView.snp.top).inset(-12)
            $0.height.equalTo(1)
        }
        
        userNameTextLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(164)
            $0.bottom.equalTo(seperateLine.snp.top).inset(-42)
        }
        
        profileIconButton.snp.makeConstraints {
            $0.centerX.equalTo(userNameTextLabel)
            $0.bottom.equalTo(userNameTextLabel.snp.top).inset(-8)
        }
    }
    
    // MARK: -Action Function
    @objc
    private func touchUpCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func touchUpChatView(sender : UITapGestureRecognizer) {
        print("You touched chat view")
    }
    
    @objc
    private func touchUpEditProfileView(sender : UITapGestureRecognizer) {
        print("You touched edit-profile view")
    }
    
    @objc
    private func touchUpKakaoStoryView(sender : UITapGestureRecognizer) {
        print("You touched kakao-story view")
    }
    
    func dataBind(userName: String) {
        userNameTextLabel.text = "\(userName)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        setLayout()
    }
}
