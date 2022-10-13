//
//  SecondViewController.swift
//  IN_SOPT_First_Task_
//
//  Created by 박의서 on 2022/10/04.
//

import UIKit
import SnapKit

final class NewAccountViewContoller: UIViewController {

    private let startKakaoTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.text = "카카오톡을 시작합니다"
        return label
    }()
    
    private let idTextField: UITextField = {
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 또는 전화번호", attributes: attribute)
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 333, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    private let passwdTextField: UITextField = {
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: attribute)
        textField.isSecureTextEntry = true
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 333, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    private let checkPasswdTextField: UITextField = {
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호 확인", attributes: attribute)
        textField.isSecureTextEntry = true
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 333, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    private lazy var makeAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(touchupmakeAccountButton), for: .touchUpInside)
        return button
    }()
    
    private func layout() {
        view.addSubviews(startKakaoTextLabel, idTextField, passwdTextField, checkPasswdTextField, makeAccountButton)
        
        startKakaoTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.trailing.equalToSuperview().inset(89)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(startKakaoTextLabel.snp.bottom).offset(116)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(49)
        }
        
        passwdTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(10)
            make.leading.trailing.equalTo(idTextField)
            make.height.equalTo(idTextField)
        }
        
        checkPasswdTextField.snp.makeConstraints { make in
            make.top.equalTo(passwdTextField.snp.bottom).offset(10)
            make.leading.trailing.equalTo(idTextField)
            make.height.equalTo(idTextField)
        }
        
        makeAccountButton.snp.makeConstraints { make in
            make.top.equalTo(checkPasswdTextField.snp.bottom).offset(26)
            make.leading.trailing.equalToSuperview().inset(26)
            make.height.equalTo(44)
        }
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        let kakaoProfileVC = KakaoProfileViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        
        if let userName = idTextField.text {
            welcomeVC.dataBind(userName: userName)
            kakaoProfileVC.dataBind(userName: userName)
        }
        self.present(welcomeVC, animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func touchupmakeAccountButton() {
        presentToWelcomeVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
}
