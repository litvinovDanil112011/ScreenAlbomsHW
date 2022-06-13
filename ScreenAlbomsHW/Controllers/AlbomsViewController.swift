//
//  AlbomsViewController.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 10.06.2022.
//

import UIKit

class AlbomsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
     lazy var collectionsView: UICollectionView = {
        let collectionsView = UICollectionView(frame: .zero, collectionViewLayout: layuotSections())
        collectionsView.register(PhotoCells.self, forCellWithReuseIdentifier: PhotoCells.idintifear)
        collectionsView.register(TableCells.self, forCellWithReuseIdentifier: TableCells.idintifear)
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
        return arraySection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arraySection[0].count
        case 1:
            return arraySection[1].count
        case 2:
            return arraySection[2].count
        case 3:
            return arraySection[3].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = arraySection[indexPath.section][indexPath.row]
        
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
        item.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: 5, bottom: 30, trailing: 5)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .fractionalHeight(0.475))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 5, bottom: 5, trailing: 5)
        
        let sections = NSCollectionLayoutSection(group: group)
        sections.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

        return sections
    }
    //секция 2 фото
    private func photoSectionLayuot() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: 5, bottom: 30, trailing: 5)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.4),
            heightDimension: .fractionalHeight(0.475))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 5, bottom: 5, trailing: 5)
        let sections = NSCollectionLayoutSection(group: group)
        sections.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
    return sections
    }
    
    //секция 3 таблица
    private func tableSectionLayuot() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.1 / 2),
            heightDimension: .fractionalHeight(0.1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.1),
            heightDimension: .fractionalHeight(0.1 / 2))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1)
        let sections = NSCollectionLayoutSection(group: group)
        sections.contentInsets.leading = MetricSections.sectionsLeading
        sections.contentInsets.top = MetricSections.sectionsTop
    return sections
    }
    
    //секция 4 таблица
    private func tableSettingsSectionLayuot() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.1 / 2),
            heightDimension: .fractionalHeight(0.1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.1),
            heightDimension: .fractionalHeight(0.1 / 2))
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1)
        
        let sections = NSCollectionLayoutSection(group: group)
        sections.contentInsets.leading = MetricSections.sectionsLeading
        sections.contentInsets.top = MetricSections.sectionsTop
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
    
    var arraySection: [[Model]] = [
        //секция 1 альбомы
        [Model(image: UIImage(named: "search1"), title: "недавние", countOfItems: "12"),
         Model(image: UIImage(named: "search2"), title: "Мы", countOfItems: "23"),
         Model(image: UIImage(named: "search4"), title: "Учеба", countOfItems: "14"),
         Model(image: UIImage(named: "search1"), title: "Вульф", countOfItems: "11"),
         Model(image: UIImage(named: "search1"), title: "Тусе", countOfItems: "45"),
         Model(image: UIImage(named: "search4"), title: "MacBook", countOfItems: "31"),
         Model(image: UIImage(named: "search1"), title: "Еда", countOfItems: "1"),
         Model(image: UIImage(named: "search1"), title: "Работа", countOfItems: "57")],
        //Секция 2 Фото
        [Model(image: UIImage(named: "search3"), title: "недавние", countOfItems: "12"),
         Model(image: UIImage(named: "search2"), title: "Мы", countOfItems: "23"),
         Model(image: UIImage(named: "search1"), title: "Учеба", countOfItems: "14"),
         Model(image: UIImage(named: "search2"), title: "Вульф", countOfItems: "11"),
         Model(image: UIImage(named: "search2"), title: "Тусе", countOfItems: "45"),
         Model(image: UIImage(named: "search4"), title: "MacBook", countOfItems: "31"),],
        //секция 3 таблица
        [Model(image: UIImage(systemName: "video"), title: "Видео", countOfItems: "12"),
         Model(image: UIImage(systemName: "person.crop.square"), title: "Селфи", countOfItems: "23"),
         Model(image: UIImage(systemName: "cube"), title: "Портреты", countOfItems: "14"),
         Model(image: UIImage(systemName: "pano"), title: "Панорамы", countOfItems: "11"),
         Model(image: UIImage(systemName: "square.stack.3d.down.right"), title: "Серии", countOfItems: "45"),
         Model(image: UIImage(systemName: "square.stack.3d.forward.dottedline"), title: "Анимированные", countOfItems: "31"),],
        //секция 4 настройка таблица
        [Model(image: UIImage(systemName: "square.and.arrow.down"), title: "Импортированые", countOfItems: "12"),
         Model(image: UIImage(systemName: "eye.slash"), title: "Скрытые", countOfItems: "23"),
         Model(image: UIImage(systemName: "trash"), title: "Недавно удаленные", countOfItems: "14"),]
    ]
}
//MARK: Enums
enum Sections: Int {
    case albomsSections = 0
    case photoSections = 1
    case tableSections = 2
    case tableSettingsSections = 3
}

enum MetricSections {
    static let sectionsLeading: CGFloat = 5
    static let sectionsTop: CGFloat = 20
}
