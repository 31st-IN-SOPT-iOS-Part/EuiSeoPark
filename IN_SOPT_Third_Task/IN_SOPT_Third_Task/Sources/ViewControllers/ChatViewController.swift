//
//  ChatViewController.swift
//  IN_SOPT_Third_Task
//
//  Created by 박의서 on 2022/11/02.
//

import UIKit
import Then
import SnapKit

final class ChatViewController: UIViewController {
    
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
    
    private let chatHeaderView = UIView()
    private let chatHeaderImageView = UIImageView().then {
        $0.image = UIImage(named: "chatHeader")
    }
    
    private lazy var kakaoChatTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.tableHeaderView = chatHeaderView
        $0.separatorStyle = .none
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
    }
    
    var kakaoProfileList: [KakaoProfileModel] = [
        KakaoProfileModel(profileImage: "profileImage1", name: "솝트", statusMessage: "사랑해"),
        KakaoProfileModel(profileImage: "profileImage2", name: "솝트", statusMessage: "사랑해"),
        KakaoProfileModel(profileImage: "profileImage3", name: "솝트", statusMessage: "사랑해"),
        KakaoProfileModel(profileImage: "profileImage4", name: "솝트", statusMessage: "사랑해"),
        KakaoProfileModel(profileImage: "profileImage5", name: "솝트", statusMessage: "사랑해"),
        KakaoProfileModel(profileImage: "profileImage6", name: "솝트", statusMessage: "사랑해"),
        KakaoProfileModel(profileImage: "profileImage7", name: "솝트", statusMessage: "사랑해"),
        KakaoProfileModel(profileImage: "profileImage8", name: "솝트", statusMessage: "사랑해"),
        KakaoProfileModel(profileImage: "profileImage9", name: "솝트", statusMessage: "사랑해")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
        kakaoChatTableView.layoutIfNeeded()
    }
}

extension ChatViewController {
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubviews(chatTopView, kakaoChatTableView)
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
        
        kakaoChatTableView.snp.makeConstraints {
            $0.top.equalTo(chatTopView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50 * kakaoProfileList.count)
        }
        
        chatHeaderView.addSubviews(chatHeaderImageView)
        chatHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        chatHeaderImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(9)
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
        let photoGridVC = PhotoGridViewController()
        photoGridVC.modalPresentationStyle = .fullScreen
        self.present(photoGridVC, animated: true, completion: nil)
    }
    
    private func register() {
        kakaoChatTableView.register(KakaoProfileTableViewCell.self, forCellReuseIdentifier: KakaoProfileTableViewCell.identifier)
    }
    
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: nil) { (action, view, completion) in
            self.kakaoProfileList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        tableView.reloadData()
        
        action.backgroundColor = .red
        action.title = "삭제"
        
        let configuration = UISwipeActionsConfiguration(actions: [action])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kakaoProfileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileViewCell = tableView.dequeueReusableCell(withIdentifier: KakaoProfileTableViewCell.identifier, for: indexPath) as? KakaoProfileTableViewCell else { return UITableViewCell() }
        
        profileViewCell.dataBind(model: kakaoProfileList[indexPath.row])
        return profileViewCell
    }
}
