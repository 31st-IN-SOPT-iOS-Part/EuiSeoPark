//
//  MoreViewController.swift
//  IN_SOPT_Third_Task
//
//  Created by 박의서 on 2022/10/30.
//

import UIKit

final class MoreViewController: UIViewController {
    
    private let moreImageTopView = UIView()

    private lazy var closeIconButton = UIButton().then {
        $0.setImage(UIImage(named: "iconClose"), for: .normal)
        $0.addTarget(self, action: #selector(touchUpCloseButton), for: .touchUpInside)
    }
    
    private let recentImageTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.text = "최근 항목"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

extension MoreViewController {
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubviews(moreImageTopView)
        
        moreImageTopView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(38)
        }
        
        moreImageTopView.addSubviews(closeIconButton, recentImageTextLabel)
        closeIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.leading.equalToSuperview().inset(12)
            $0.width.height.equalTo(24)
        }
        recentImageTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc
    private func touchUpCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
