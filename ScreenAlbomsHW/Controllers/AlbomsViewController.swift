//
//  AlbomsViewController.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 10.06.2022.
//

import UIKit

class AlbomsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let collectionsView: UICollectionView = {
        let collectionsView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionsView.register(PhotoCells.self, forCellWithReuseIdentifier: PhotoCells.idintifear)
        return collectionsView
    }()
    
    var arraySection: [Model] = [
        Model(image: UIImage(named: "IMG0"), title: "test", countOfItems: "test"),
        Model(image: UIImage(named: "IMG1"), title: "test", countOfItems: "test")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        view.backgroundColor = .white
        collectionsView.delegate = self
        collectionsView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCells.idintifear, for: indexPath)
        return cell
    }
    // секция 1
    private func albomsSectionLayuot() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .fractionalHeight(0.8))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 2)
        
        let sections = NSCollectionLayoutSection(group: group)
        sections.interGroupSpacing = .zero
        sections.contentInsets = NSDirectionalEdgeInsets(
            top: .zero,
            leading: 10,
            bottom: 90,
            trailing: 10)
    return sections
    }
}
