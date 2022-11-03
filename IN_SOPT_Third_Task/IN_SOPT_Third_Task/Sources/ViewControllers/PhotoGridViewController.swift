//
//  PhotoGridViewController.swift
//  IN_SOPT_Third_Task
//
//  Created by 박의서 on 2022/10/30.
//

import UIKit

class PhotoGridViewController: UIViewController {
    
    private let photoGridTopView = UIView()

    private lazy var closeIconButton = UIButton().then {
        $0.setImage(UIImage(named: "iconClose"), for: .normal)
        $0.addTarget(self, action: #selector(touchUpCloseButton), for: .touchUpInside)
    }
    
    private let recentImageTextLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.text = "최근 항목"
    }
    
    private lazy var photoGridCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var photoGridList: [PhotoGridModel] = [
        PhotoGridModel(image: "selecImage"), PhotoGridModel(image: "galleryImage1"), PhotoGridModel(image: "galleryImage2"), PhotoGridModel(image: "galleryImage3"), PhotoGridModel(image: "galleryImage4"), PhotoGridModel(image: "galleryImage5"), PhotoGridModel(image: "galleryImage6"), PhotoGridModel(image: "galleryImage7"), PhotoGridModel(image: "galleryImage8"), PhotoGridModel(image: "galleryImage9"), PhotoGridModel(image: "galleryImage10"), PhotoGridModel(image: "galleryImage11"), PhotoGridModel(image: "galleryImage12"), PhotoGridModel(image: "galleryImage13"), PhotoGridModel(image: "galleryImage14"), PhotoGridModel(image: "galleryImage15"), PhotoGridModel(image: "galleryImage16"), PhotoGridModel(image: "galleryImage17"), PhotoGridModel(image: "galleryImage18"), PhotoGridModel(image: "galleryImage19"), PhotoGridModel(image: "galleryImage20"), PhotoGridModel(image: "galleryImage21"), PhotoGridModel(image: "galleryImage22"), PhotoGridModel(image: "galleryImage23")
    ]
    
    // MARK: - constants
    final let photoGridInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    final let photoGridLineSpacing: CGFloat = 7
    final let photoGridInterItemSpacing: CGFloat = 9
    final let photoGridCellHeight: CGFloat = 119

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
    }
}

extension PhotoGridViewController {
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubviews(photoGridTopView, photoGridCollectionView)
        
        photoGridTopView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(38)
        }
        
        photoGridTopView.addSubviews(closeIconButton, recentImageTextLabel)
        closeIconButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(7)
            $0.leading.equalToSuperview().inset(12)
            $0.width.height.equalTo(24)
        }
        recentImageTextLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.centerX.equalToSuperview()
        }
        
        photoGridCollectionView.snp.makeConstraints {
            $0.top.equalTo(photoGridTopView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc
    private func touchUpCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(photoGridList.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * photoGridCellHeight + (heightCount - 1) * photoGridLineSpacing + photoGridInset.top + photoGridInset.bottom
    }
    
    private func register() {
        photoGridCollectionView.register(PhotoGridCollectionViewCell.self, forCellWithReuseIdentifier: PhotoGridCollectionViewCell.identifier)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {

        // cell 하나의 크기를 정해주는 함수에요. CGSize를 리턴합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let tripleCellWidth = screenWidth - photoGridInset.left - photoGridInset.right - photoGridInterItemSpacing
        return CGSize(width: tripleCellWidth / 3, height: 119)
    }
    
        // Layout 구현 흐름에서 줄 바꿈의 간격을 정해주는 함수에요.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return photoGridLineSpacing
    }
    
        // Layout 구현 흐름에서 줄 바꿈이 아닌 셀 간 간격을 정해주는 함수에요.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return photoGridInterItemSpacing / 3
    }
    
        // CollectionView 섹션 하나 당의 Inset을 정해주는 함수에요.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return photoGridInset
    }
}

// MARK: -UICollectionViewDataSource

extension PhotoGridViewController: UICollectionViewDataSource {
        
        // cell 몇 개 만들래? 라고 물어봅니다,,,
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGridList.count
    }
    
        // 어떤 cell을 만들거니? 라고 물어보네요,,,
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoGridCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoGridCollectionViewCell.identifier, for: indexPath)
                as? PhotoGridCollectionViewCell else { return UICollectionViewCell() }
        photoGridCell.dataBind(model: photoGridList[indexPath.item])
        return photoGridCell
    }
}
