//
//  BookView.swift
//  desafio-inevent
//
//  Created by Douglas Biagi Grana on 13/04/22.
//

import UIKit

class BookView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.contentSize = CGSize(width: frame.width, height: frame.height + 800)
        sv.backgroundColor = UIColor.systemGray6
        return sv
    }()
    
    lazy var contentView: UIView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var bookImage: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var publicacaoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    lazy var sinopseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpViews()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookView {
    private func setUpViews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.bookImage)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.publicacaoLabel)
        self.contentView.addSubview(self.sinopseLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            bookImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            bookImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            bookImage.heightAnchor.constraint(equalToConstant: 250),
            bookImage.widthAnchor.constraint(equalToConstant: 200),
            
            titleLabel.centerXAnchor.constraint(equalTo: self.bookImage.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.bookImage.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            publicacaoLabel.centerXAnchor.constraint(equalTo: self.bookImage.centerXAnchor),
            publicacaoLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            publicacaoLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            publicacaoLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            
            sinopseLabel.centerXAnchor.constraint(equalTo: self.bookImage.centerXAnchor),
            sinopseLabel.topAnchor.constraint(equalTo: self.publicacaoLabel.bottomAnchor, constant: 30),
            sinopseLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            sinopseLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
        ])
    }
}
