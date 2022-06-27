//
//  AlbomsViewController.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 10.06.2022.
//

import UIKit

class AlbomsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var modelData = Data().data
    
     lazy var collectionsView: UICollectionView = {
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
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return modelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return modelData[0].count
        case 1:
            return modelData[1].count
        case 2:
            return modelData[2].count
        case 3:
            return modelData[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = modelData[indexPath.section][indexPath.row]
        
        switch (indexPath as NSIndexPath).section {
        case 0:
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCells.idintifear, for: indexPath) as! PhotoCells
            cell.image.image = model.image
            cell.title.text = model.title
            cell.countOfItems.text = model.countOfItems
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCells.idintifear, for: indexPath) as! PhotoCells
            cell.image.image = model.image
            cell.title.text = model.title
            cell.countOfItems.text = model.countOfItems
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCells.idintifear, for: indexPath) as! TableCells
            cell.imageTable.image = model.image
            cell.titleTable.text = model.title
            cell.countOfItemsTable.text = model.countOfItems
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCells.idintifear, for: indexPath) as! TableCells
            cell.imageTable.image = model.image
            cell.titleTable.text = model.title
            cell.countOfItemsTable.text = model.countOfItems
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    //MARK: Sections Layuot
    // секция 1 альбомы
    private func albomsSectionLayuot() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 5)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .fractionalHeight(0.475))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5)
        
        let sections = NSCollectionLayoutSection(group: group)
        sections.orthogonalScrollingBehavior = .paging
        // hender
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(0.4),
            heightDimension: .absolute(45))
        let hender = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        sections.boundarySupplementaryItems = [hender]
        return sections
    }
    //секция 2 фото
    private func photoSectionLayuot() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: .zero, trailing: 5)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 5)
        let sections = NSCollectionLayoutSection(group: group)
        sections.orthogonalScrollingBehavior = .paging
        // hender
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(0.4),
            heightDimension: .absolute(45))
        let hender = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        sections.boundarySupplementaryItems = [hender]
    return sections
    }
    //секция 3 таблица
    private func tableSectionLayuot() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.1),
            heightDimension: .fractionalHeight(0.1 / 2))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5)
        let sections = NSCollectionLayoutSection(group: group)
        // hender
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(0.4),
            heightDimension: .absolute(45))
        let hender = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        sections.boundarySupplementaryItems = [hender]
    return sections
    }
    //секция 4 таблица
    private func tableSettingsSectionLayuot() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.1),
            heightDimension: .absolute(45))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5)
        let sections = NSCollectionLayoutSection(group: group)
        sections.contentInsets.leading = MetricSections.sectionsLeading
        sections.contentInsets.top = MetricSections.sectionsTop
        // hender
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(0.4),
            heightDimension: .absolute(45))
        let hender = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        sections.boundarySupplementaryItems = [hender]
    return sections
    }
    
    private func layuotSections() -> UICollectionViewLayout {
        let layuot = UICollectionViewCompositionalLayout {
            (sectionsIndex: Int, layuot: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionsLayuot = Sections(rawValue: sectionsIndex) else { return nil }
            
            switch sectionsLayuot {
            case .albomsSections:
                return self.albomsSectionLayuot()
            case .photoSections:
                return self.photoSectionLayuot()
            case .tableSections:
                return self.tableSectionLayuot()
            case .tableSettingsSections:
                return self.tableSettingsSectionLayuot()
            }
        }
        return layuot
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HenderView.idintifiar, for: indexPath) as? HenderView else {
          return HenderView()}
        
        header.frame.size.height = 60
        
          switch indexPath.section {
          case 0:
              header.label.text = "Мои Альбомы"
          case 1:
              header.label.text = "Общие альбомы"
          case 2:
              header.label.text = "Типы медиафайлов"
          case 3:
              header.label.text = "Другое"
          default:
              break
          }
        return header
    }
}

//MARK: Enums
enum Sections: Int {
    case albomsSections = 0
    case photoSections = 1
    case tableSections = 2
    case tableSettingsSections = 3
}

enum MetricSections {
    static let sectionsLeading: CGFloat = 2
    static let sectionsTop: CGFloat = 10
}
