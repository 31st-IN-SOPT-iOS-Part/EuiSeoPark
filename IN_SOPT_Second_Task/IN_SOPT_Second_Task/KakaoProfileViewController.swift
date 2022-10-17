//
//  KakaoProfileViewController.swift
//  IN_SOPT_Second_Task
//
//  Created by 박의서 on 2022/10/12.
//

import UIKit

class KakaoProfileViewController: UIViewController {
    
    // MARK: - Profile
    private let profileView: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile_closeBtn"), for: .normal)
        button.addTarget(self, action: #selector(touchUpCloseButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var profileIconButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "profile_userImg"), for: .normal)
        return button
    }()
    
    private let userNameTextLabel: UILabel = {
        let label = UILabel()
        label.text = "김솝트"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    // MARK: - Bottom Button StackView
    private let chatIconImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "profileTalkImg")
        return image
    }()
    
    private let chatTextLabel: UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private let editProfileImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "profile_editImg")
        return image
    }()
    
    private let editProfileTextLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private let kakaoStoryImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "profileStoryImg")
        return image
    }()
    
    private let kakaoStoryTextLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.textColor = .white
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var chatView: UIView = {
        let view = UIView()
        let touchGesture = UITapGestureRecognizer(target: self, action:  #selector(touchUpChatView))
        view.addGestureRecognizer(touchGesture)
        return view
    }()
    
    private lazy var editProfileView: UIView = {
        let view = UIView()
        let touchGesture = UITapGestureRecognizer(target: self, action:  #selector(touchUpEditProfileView))
        view.addGestureRecognizer(touchGesture)
        return view
    }()
    
    private lazy var kakaoStoryView: UIView = {
        let view = UIView()
        let touchGesture = UITapGestureRecognizer(target: self, action:  #selector(touchUpKakaoStoryView))
        view.addGestureRecognizer(touchGesture)
        return view
    }()
    
    // MARK: - line
    private let seperateLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    // MARK: - layout
    private func layout() {
        
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
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(44)
            make.bottom.equalToSuperview().inset(47)
            make.height.equalTo(72)
        }
        
        chatView.addSubviews(chatIconImage, chatTextLabel)
        chatIconImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(22)
            make.leading.equalToSuperview().inset(39)
            make.trailing.equalToSuperview().inset(32)
            make.width.equalTo(19)
            make.height.equalTo(18)
        }
        chatTextLabel.snp.makeConstraints { make in
            make.top.equalTo(chatIconImage.snp.bottom).offset(8)
            make.centerX.equalTo(chatIconImage)
        }
        
        editProfileView.addSubviews(editProfileImage, editProfileTextLabel)
        editProfileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.leading.equalToSuperview().inset(39)
            make.trailing.equalToSuperview().inset(39)
            make.width.equalTo(18)
            make.height.equalTo(19)
        }
        editProfileTextLabel.snp.makeConstraints { make in
            make.top.equalTo(editProfileImage.snp.bottom).offset(10)
            make.centerX.equalTo(editProfileImage)
        }
        
        kakaoStoryView.addSubviews(kakaoStoryImage, kakaoStoryTextLabel)
        kakaoStoryImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(19)
            make.leading.equalToSuperview().inset(39)
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(18)
            make.height.equalTo(19)
        }
        kakaoStoryTextLabel.snp.makeConstraints { make in
            make.top.equalTo(kakaoStoryImage.snp.bottom).offset(10)
            make.centerX.equalTo(kakaoStoryImage)
        }
        
        seperateLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(stackView.snp.top).inset(-12)
            make.height.equalTo(1)
        }
        
        userNameTextLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(164)
            make.bottom.equalTo(seperateLine.snp.top).inset(-42)
        }
        
        profileIconButton.snp.makeConstraints { make in
            make.centerX.equalTo(userNameTextLabel)
            make.bottom.equalTo(userNameTextLabel.snp.top).inset(-8)
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
        layout()
    }
}
