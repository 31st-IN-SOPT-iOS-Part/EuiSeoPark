//
//  KakaoProfileTableViewCell.swift
//  IN_SOPT_Third_Task
//
//  Created by 박의서 on 2022/10/31.
//

import UIKit
import SwiftyColor

final class KakaoProfileTableViewCell: UITableViewCell {
    
    // MARK: - identifire
    static let identifier = "KakaoProfileTableViewCell"
    
    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    private let profileContainerView = UIView()
    private let profileImageView = UIImageView()
    
    private let nameTextLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12)
    }
    
    private let statusMessageTextLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11)
    }
    
    // MARK: - General Helpers
    func dataBind(model: KakaoProfileModel) {
        profileImageView.image = UIImage(named: model.profileImage)
        nameTextLabel.text = model.name
        statusMessageTextLabel.text = model.statusMessage
    }
}

extension KakaoProfileTableViewCell {
    private func setLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        
        contentView.addSubviews(profileImageView,nameTextLabel,statusMessageTextLabel)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(44)
            $0.height.equalTo(41)
            $0.bottom.equalToSuperview().inset(5)
        }
        nameTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(11)
        }
        statusMessageTextLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextLabel.snp.bottom).offset(3)
            $0.leading.equalTo(nameTextLabel)
        }
    }
}
