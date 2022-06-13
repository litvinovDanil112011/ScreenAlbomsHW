//
//  HenderView.swift
//  ScreenAlbomsHW
//
//  Created by Daniil Litvinov on 13.06.2022.
//

import UIKit

class HenderView: UICollectionReusableView {
    
    static let idintifiar = "HenderView"
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray3
        return line
    }()
    
    lazy var label: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.font = .systemFont(ofSize: 20)
        lable.textColor = .black
        return lable
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHerarchy()
        setupLayuot()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    private func setupHerarchy(){
        addSubview(stackView)
        addSubview(line)
        stackView.addSubview(label)
    }
    
    private func setupLayuot(){
        line.translatesAutoresizingMaskIntoConstraints = false
        line.bottomAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        line.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }
}
