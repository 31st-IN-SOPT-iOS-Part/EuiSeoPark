//
//  ThirdViewController.swift
//  IN_SOPT_First_Task_
//
//  Created by 박의서 on 2022/10/04.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var userName: String?
    
    private let firstTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 300, width: 200, height: 100))
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "000님 \n환영합니다"
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 440, width: 350, height: 50))
        button.backgroundColor = .systemYellow
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(touchupConfirmButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let components: [Any] = [firstTextLabel,confirmButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }
    
    @objc private func touchupConfirmButton() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func dataBind(userName: String) {
        firstTextLabel.text = "\(userName)님 \n환영합니다"
    }

}
