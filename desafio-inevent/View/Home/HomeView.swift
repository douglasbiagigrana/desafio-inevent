//
//  HomeView.swift
//  desafio-inevent
//
//  Created by Douglas Biagi Grana on 11/04/22.
//

import UIKit

class HomeView: UIView {
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.showsHorizontalScrollIndicator = false
        tv.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tv
    }()
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpViews()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    private func setUpViews() {
        self.addSubview(self.tableView)
    }
    
    private func setUpConstraints() {
        self.tableView.pinView(to: self)
    }
}
