//
//  ThirdViewController.swift
//  IN_SOPT_First_Task_
//
//  Created by 박의서 on 2022/10/04.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    var name: String?
    
    private let firstTextLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.text = "000님 \n환영합니다"
    }
    
    private lazy var confirmButton = UIButton().then {
        $0.backgroundColor = .systemYellow
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(touchupConfirmButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        view.addSubviews(firstTextLabel,confirmButton)
        
        firstTextLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(197)
            $0.leading.trailing.equalToSuperview().inset(144)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(firstTextLabel.snp.bottom).offset(117)
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(44)
        }
    }
    
    @objc private func touchupConfirmButton() {
        let friendListVC = FriendListViewController()
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        
        if let userName  = name {
            friendListVC.dataBind(userName: userName)
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
        sceneDelegate.window?.rootViewController = friendListVC
    }
    
    func dataBind(userName: String) {
        name = userName
        firstTextLabel.text = "\(userName)님 \n환영합니다"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
}
