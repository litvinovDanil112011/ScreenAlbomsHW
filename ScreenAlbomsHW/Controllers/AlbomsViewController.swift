//
//  AlbomsViewController.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 10.06.2022.
//

import UIKit

class AlbomsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    private let collectionsView: UICollectionView = {
        let collectionsView = UICollectionView()
        collectionsView.register(PhotoCells.self, forCellWithReuseIdentifier: PhotoCells.idintifear)
        return collectionsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        view.backgroundColor = .white
        collectionsView.delegate = self
        collectionsView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCells.idintifear, for: indexPath)
        return cell
    }
    
}
