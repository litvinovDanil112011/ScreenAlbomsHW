//
//  TableCells.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 10.06.2022.
//

import UIKit

class TableCells: UICollectionViewCell {
   static let idintifear = "TableCells"
    
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
        image.widthAnchor.constraint(equalToConstant: MetricTable.sizeImage).isActive = true
        image.heightAnchor.constraint(equalToConstant: MetricTable.sizeImage).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MetricTable.leadingImage).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: MetricTable.leadingTitle).isActive = true
        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        countOfItems.translatesAutoresizingMaskIntoConstraints = false
        countOfItems.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        countOfItems.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: MetricTable.countTraling).isActive = true
    }
}

enum MetricTable {
    static let sizeImage: CGFloat = 27
    static let leadingImage: CGFloat = 15
    static let leadingTitle: CGFloat = 20
    static let countTraling: CGFloat = 20
}
