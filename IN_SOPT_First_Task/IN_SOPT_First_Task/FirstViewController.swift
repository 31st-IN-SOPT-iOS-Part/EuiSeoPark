//
//  ViewController.swift
//  IN_SOPT_First_Task_
//
//  Created by 박의서 on 2022/10/03.
//

import UIKit

class FirstViewController: UIViewController {

    private let firstTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "카카오톡을 시작합니다"
        return label
    }()
    
    private let secondTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 125, width: 300, height: 100))
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemGray
        label.text = "사용하던 카카오계정이 있다면 \n이메일 또는 전화번호로 로그인해주세요."
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 225, width: 350, height: 30))
        textField.placeholder = "이메일 또는 전화번호"
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 350, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    private let passwdTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 300, width: 350, height: 30))
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 350, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 375, width: 350, height: 50))
        button.backgroundColor = .systemGray6
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(touchupLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var newAccountButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 440, width: 350, height: 50))
        button.backgroundColor = .systemGray6
        button.setTitle("새로운 카카오게정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(touchupNewAccountButton), for: .touchUpInside)
        return button
    }()
    
    private let findAccountButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 510, width: 350, height: 25))
        button.backgroundColor = .none
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font =  .systemFont(ofSize: 15)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let components: [Any] = [firstTextLabel, secondTextLabel, idTextField, passwdTextField, loginButton, newAccountButton, findAccountButton]
        components.forEach {
            view.addSubview($0 as! UIView)
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

