//
//  PhotoCells.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 10.06.2022.
//

import UIKit

class PhotoCells: UICollectionViewCell {
    
    static let idintifear = "PhotoCells"
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

    private let title: UILabel = {
        let title = UILabel()
        title.textColor = .systemBlue
        return title
    }()
    
    private let countOfItems: UILabel = {
        let count = UILabel()
        count.textColor = .systemGray3
        return count
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHerarchY()
        setupLayuot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHerarchY(){
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(countOfItems)
    }
    
    private func setupLayuot(){
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: MetricPhoto.sizeImage).isActive = true
        image.widthAnchor.constraint(equalToConstant: MetricPhoto.sizeImage).isActive = true

        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: MetricPhoto.paddingImageAndTitle).isActive = true
        
        countOfItems.translatesAutoresizingMaskIntoConstraints = false
        countOfItems.topAnchor.constraint(equalTo: title.bottomAnchor, constant: MetricPhoto.paddingTitleAndCount).isActive = true
    }
}

enum MetricPhoto {
    static let sizeImage: CGFloat = 100
    static let paddingImageAndTitle: CGFloat = 10
    static let paddingTitleAndCount: CGFloat = 5
}
