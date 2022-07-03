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
