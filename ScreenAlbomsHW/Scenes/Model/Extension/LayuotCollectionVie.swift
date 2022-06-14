//
//  LayuotCollectionVie.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 12.06.2022.
//

import UIKit

extension AlbomsViewController {
    
    func setupCollectionsframe(){
        view.addSubview(collectionsView)
        collectionsView.frame = view.bounds
        collectionsView.backgroundColor = .white
    }
}
