//
//  KakaoProfileTableViewHeaderView.swift
//  IN_SOPT_Third_Task
//
//  Created by 박의서 on 2022/10/31.
//

import UIKit
import Then
import SnapKit
import SwiftyColor

final class KakaoProfileTableViewHeaderView: UITableViewHeaderFooterView {
    private let myProfileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile_userImg")
    }
    
    private let myProfileNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private let myStatusMessageLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension KakaoProfileTableViewHeaderView {
    
    func dataBind(model: KakaoProfileModel) {
        myProfileImageView.image = UIImage(named: model.profileImage)
        myProfileNameLabel.text = model.name
        myStatusMessageLabel.text = model.statusMessage
    }
    
    private func setLayout() {
        contentView.backgroundColor = .white
        contentView.addSubviews(myProfileImageView, myProfileNameLabel, myStatusMessageLabel)
        
        myProfileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
        
        myProfileNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalTo(myProfileImageView.snp.trailing).offset(11)
        }
        
        myStatusMessageLabel.snp.makeConstraints {
            $0.top.equalTo(myProfileNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(myProfileNameLabel)
        }
    }
}

