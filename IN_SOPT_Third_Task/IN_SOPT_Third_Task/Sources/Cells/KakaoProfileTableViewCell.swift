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
}

extension KakaoProfileTableViewCell {
    private func setLayout() {
        
    }
}
