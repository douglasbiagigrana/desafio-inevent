//
//  ViewController.swift
//  desafio-inevent
//
//  Created by Douglas Biagi Grana on 11/04/22.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    private var screen: HomeView?
    private let bookNetworking: BookNetworking = BookNetworking()
    private var bookData = [BookResponse]()
    private var bookFilter: [BookResponse] = []
    
    lazy var searchBar: UISearchController = {
        let s = UISearchController(searchResultsController: nil)
        s.obscuresBackgroundDuringPresentation = false
        s.searchBar.placeholder = "Procure aqui os livros"
        s.searchBar.sizeToFit()
        s.searchBar.searchBarStyle = .prominent
        s.searchBar.delegate = self
        return s
    }()
    
    override func loadView() {
        self.screen = HomeView()
        self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchBookByTitle()
        self.configView()
    }
}

//MARK: METHODS
extension HomeViewController {
    private func configView() {
        self.screen?.tableView.rowHeight = 80
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Mercado Editorial - Consulta"
        navigationItem.searchController = searchBar
    }
    
    private func fetchBookByTitle() {
        bookNetworking.fetchBookByTitle { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let response):
                for item in response.books {
                    let data = BookResponse(titulo: item.titulo, subTitulo: item.subTitulo ?? "", dataPublicacao: item.dataPublicacao, sinopse: item.sinopse, imagem: item.imagens.imagemPrimeiraCapa.pequena)
                    self.bookData.append(data)
                    self.bookFilter = self.bookData
                }
                DispatchQueue.main.async {
                    self.screen?.tableView.reloadData()
                }
            case.failure(let error):
                print("Error Fetch in HVC -> \(error.localizedDescription)")
            }
        }
    }
}

//MARK: SEARCHBAR
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.bookFilter = []
        if searchText.isEmpty {
            self.bookFilter = self.bookData
        } else {
            for value in bookData {
                if value.titulo.uppercased().contains(searchText.uppercased()) {
                    self.bookFilter.append(value)
                }
            }
        }
        DispatchQueue.main.async {
            self.screen?.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK: TABLEVIEW
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        let imgUrl = bookFilter[indexPath.row].imagem
        cell?.bookImage.kf.setImage(with: URL(string: imgUrl))
        let verifySub = bookFilter[indexPath.row].subTitulo == "" ? "" : ": \(bookFilter[indexPath.row].subTitulo)"
        cell?.titleLabel.text = "\(bookFilter[indexPath.row].titulo) \(verifySub)"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookViewController = BookViewController()
        bookViewController.bookImg = bookFilter[indexPath.row].imagem
        bookViewController.bookTitle = bookFilter[indexPath.row].titulo
        bookViewController.bookPubli = bookFilter[indexPath.row].dataPublicacao
        bookViewController.bookSinopse = bookFilter[indexPath.row].sinopse
        navigationController?.pushViewController(bookViewController, animated: true)
    }
}

