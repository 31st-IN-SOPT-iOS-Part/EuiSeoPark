//
//  ViewController.swift
//  IN_SOPT_First_Task_
//
//  Created by 박의서 on 2022/10/03.
//

import UIKit
import SnapKit

final class FirstViewController: UIViewController {

    private let firstTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.text = "카카오톡을 시작합니다"
        return label
    }()
    
    private let secondTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.text = "사용하던 카카오계정이 있다면 \n이메일 또는 전화번호로 로그인해주세요."
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(touchupLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var newAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.setTitle("새로운 카카오게정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(touchupNewAccountButton), for: .touchUpInside)
        return button
    }()
    
    private let findAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .none
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font =  .systemFont(ofSize: 13)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private func layout() {
        view.addSubviews(firstTextLabel, secondTextLabel, idTextField, passwdTextField, loginButton, newAccountButton, findAccountButton)
        
        firstTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.trailing.equalToSuperview().inset(89)
        }
        
        secondTextLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTextLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(67)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(secondTextLabel.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(49)
        }
        
        passwdTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(10)
            make.leading.trailing.equalTo(idTextField)
            make.height.equalTo(idTextField)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwdTextField.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(44)
        }
        
        newAccountButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.leading.trailing.equalTo(loginButton)
            make.height.equalTo(loginButton)
        }
        
        findAccountButton.snp.makeConstraints { make in
            make.top.equalTo(newAccountButton.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(99)
        }
    }
    
    private func presentToThirdVC() {
        let thirdVC = ThirdViewController()
        thirdVC.modalPresentationStyle = .formSheet
        
        if let userName = idTextField.text {
            thirdVC.dataBind(userName: userName)
        }
        self.present(thirdVC, animated: true, completion: nil)
        clearTextField()
    }

    private func pushToSecondVC() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
        clearTextField()
    }
    
    @objc private func touchupLoginButton() {
        presentToThirdVC()
    }
    
    @objc private func touchupNewAccountButton() {
        pushToSecondVC()
    }
    
    private func clearTextField() {
        idTextField.text = ""
        passwdTextField.text = ""
    }


}

