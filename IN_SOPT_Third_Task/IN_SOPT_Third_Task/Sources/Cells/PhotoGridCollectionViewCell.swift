//
//  PhotoGridCollectionViewCell.swift
//  IN_SOPT_Third_Task
//
//  Created by 박의서 on 2022/11/03.
//

import UIKit
import SnapKit
import SwiftyColor
import Then

final class PhotoGridCollectionViewCell: UICollectionViewCell {
    // MARK: - identifier
    static let identifier = "PhotoGridCollectionViewCell"
    
    // MARK: - UI Components
    private let photoImageView = UIImageView()
    
    private let indexView = UIView().then {
        $0.backgroundColor = 0xF6DD2A.color
        $0.layer.cornerRadius = 9
        $0.isHidden = true
    }
    
    private let indexTextLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 10)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoGridCollectionViewCell {
    
    public func setSelected(index: Int) {
        photoImageView.layer.borderWidth = 3
        photoImageView.layer.borderColor = 0xF6DD2A.color.cgColor
        indexView.isHidden = false
        indexTextLabel.text = String(index + 1)
    }

    public func setUnselected() {
        photoImageView.layer.borderWidth = 0
        photoImageView.layer.borderColor = .none
        indexView.isHidden = true
    }
    
    public func changeIndexLabel(index: Int) {
        indexTextLabel.text = String(index + 1)
    }
    
    private func setLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubviews(photoImageView, indexView)
        photoImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        indexView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(4)
            $0.width.height.equalTo(18)
        }
        indexView.addSubviews(indexTextLabel)
        indexTextLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func dataBind(model: PhotoGridModel) {
        photoImageView.image = UIImage(named: model.image)
    }
}
