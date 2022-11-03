//
//  PhotoGridCollectionViewCell.swift
//  IN_SOPT_Third_Task
//
//  Created by 박의서 on 2022/11/03.
//

import UIKit
import SnapKit
import Then

final class PhotoGridCollectionViewCell: UICollectionViewCell {
    // MARK: - identifier
    static let identifier = "PhotoGridCollectionViewCell"
    
    // MARK: - UI Components
    private let photoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoGridCollectionViewCell {
    private func setLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubviews(photoImageView)
        photoImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func dataBind(model: PhotoGridModel) {
        photoImageView.image = UIImage(named: model.image)
    }
}
