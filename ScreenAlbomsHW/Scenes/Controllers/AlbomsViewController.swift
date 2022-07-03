//
//  AlbomsViewController.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 10.06.2022.
//

import UIKit

class AlbomsViewController: UIViewController, UICollectionViewDelegate {
    

    private var mainScreen: MainScreen! {
        guard isViewLoaded else { return nil }
        return (view as! MainScreen)

    public var modelData = Data().data
    
    public lazy var collectionsView: UICollectionView = {
        let collectionsView = UICollectionView(frame: .zero, collectionViewLayout: layuotSections())
        collectionsView.register(PhotoCells.self, forCellWithReuseIdentifier: PhotoCells.idintifear)
        collectionsView.register(TableCells.self, forCellWithReuseIdentifier: TableCells.idintifear)
        collectionsView.register(HenderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HenderView.idintifiar)
        return collectionsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        view.backgroundColor = .white
        collectionsView.delegate = self
        collectionsView.dataSource = self
        setupCollectionsframe()
>>>>>>> 0e54c7c71f1e21d2fbcc56f99e215196828d523a
    }
    
    override func loadView() {
        super.loadView()
        self.view = MainScreen()
    }
    
    public var modelData = [[Model]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}
//MARK: 
extension AlbomsViewController {
    func configureView() {
        title = "Альбомы"
        view.backgroundColor = .white
        modelData = DataModel.dataModel.confugureModels()
        mainScreen.collectionsView.dataSource = self
        mainScreen.collectionsView.delegate = self
        let models = modelData
        models.forEach { [unowned self] model in
            mainScreen.configureView(with: models)
        }
    }
}
