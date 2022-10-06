//
//  SecondViewController.swift
//  IN_SOPT_First_Task_
//
//  Created by 박의서 on 2022/10/04.
//

import UIKit

class SecondViewController: UIViewController {

    private let firstTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "카카오톡을 시작합니다"
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
    
    private let pwdTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 300, width: 350, height: 30))
        textField.placeholder = "비밀번호"
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 350, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    private let checkPwdTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 375, width: 350, height: 30))
        textField.placeholder = "비밀번호 확인"
        var bottomLine = CALayer()
        bottomLine.frame = CGRectMake(0.0, 45 - 1, 350, 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    private lazy var makeAccountButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 440, width: 350, height: 50))
        button.backgroundColor = .systemGray6
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(touchupmakeAccountButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let components: [Any] = [firstTextLabel,idTextField,pwdTextField,checkPwdTextField,makeAccountButton]
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
    }
    
    @objc private func touchupmakeAccountButton() {
        presentToThirdVC()
    }
}
