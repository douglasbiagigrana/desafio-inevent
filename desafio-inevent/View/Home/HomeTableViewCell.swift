//
//  HomeTableViewCell.swift
//  desafio-inevent
//
//  Created by Douglas Biagi Grana on 12/04/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier: String = "HomeTableViewCell"
    
    lazy var bookImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpViews()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeTableViewCell {
    private func setUpViews() {
        self.addSubview(self.bookImage)
        self.addSubview(self.titleLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            bookImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bookImage.heightAnchor.constraint(equalToConstant: 50),
            bookImage.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.bookImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
