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
        collectionsView.translatesAutoresizingMaskIntoConstraints = false
        collectionsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

       // collectionsView.frame = view.bounds
        collectionsView.backgroundColor = .white
    }
}
