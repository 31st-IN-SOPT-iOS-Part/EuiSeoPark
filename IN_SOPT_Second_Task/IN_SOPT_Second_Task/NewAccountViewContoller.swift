//
//  SecondViewController.swift
//  IN_SOPT_First_Task_
//
//  Created by 박의서 on 2022/10/04.
//

import UIKit
import SnapKit
import Then

final class NewAccountViewContoller: UIViewController {

    private let startKakaoTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.text = "카카오톡을 시작합니다"
    }
    
    private let idTextField = UITextField().then {
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let textField = UITextField()
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 333, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        $0.attributedPlaceholder = NSAttributedString(string: "이메일 또는 전화번호", attributes: attribute)
        $0.borderStyle = .none
        $0.layer.addSublayer(bottomLine)
    }
    
    private let passwdTextField = UITextField().then {
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 333, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: attribute)
        $0.isSecureTextEntry = true
        $0.borderStyle = .none
        $0.layer.addSublayer(bottomLine)
    }
    
    private let checkPasswdTextField = UITextField().then {
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 333, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호 확인", attributes: attribute)
        $0.isSecureTextEntry = true
        $0.borderStyle = .none
        $0.layer.addSublayer(bottomLine)
    }
    
    private lazy var makeAccountButton = UIButton().then {
        $0.backgroundColor = .systemGray6
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(touchupmakeAccountButton), for: .touchUpInside)
    }
    
    private func setLayout() {
        view.addSubviews(startKakaoTextLabel, idTextField, passwdTextField, checkPasswdTextField, makeAccountButton)
        
        startKakaoTextLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.leading.trailing.equalToSuperview().inset(89)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(startKakaoTextLabel.snp.bottom).offset(116)
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.height.equalTo(49)
        }
        
        passwdTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(idTextField)
        }
        
        checkPasswdTextField.snp.makeConstraints {
            $0.top.equalTo(passwdTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(idTextField)
            $0.height.equalTo(idTextField)
        }
        
        makeAccountButton.snp.makeConstraints {
            $0.top.equalTo(checkPasswdTextField.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(44)
        }
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        
        if let userName = idTextField.text {
            welcomeVC.dataBind(userName: userName)
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
        setLayout()
    }
}
