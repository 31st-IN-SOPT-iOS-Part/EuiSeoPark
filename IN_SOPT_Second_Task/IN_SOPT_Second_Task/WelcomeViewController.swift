//
//  ThirdViewController.swift
//  IN_SOPT_First_Task_
//
//  Created by 박의서 on 2022/10/04.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    var userName: String?
    
    private let firstTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "000님 \n환영합니다"
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("확인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(touchupConfirmButton), for: .touchUpInside)
        return button
    }()
    
    private func layout() {
        view.addSubviews(firstTextLabel,confirmButton)
        
        firstTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(197)
            make.leading.trailing.equalToSuperview().inset(144)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(firstTextLabel.snp.bottom).offset(117)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(44)
        }
    }
    
    @objc private func touchupConfirmButton() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
        changeRootVC()
    }
    
    func dataBind(userName: String) {
        firstTextLabel.text = "\(userName)님 \n환영합니다"
    }
    
    private func changeRootVC() {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        sceneDelegate.window?.rootViewController = FriendListViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
}
