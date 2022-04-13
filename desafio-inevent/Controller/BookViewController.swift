//
//  BookViewController.swift
//  desafio-inevent
//
//  Created by Douglas Biagi Grana on 13/04/22.
//

import UIKit
import Kingfisher

class BookViewController: UIViewController {
    
    private var screen: BookView?
    var bookImg: String = ""
    var bookTitle: String = ""
    var bookPubli: String = ""
    var bookSinopse: String = ""
    
    override func loadView() {
        self.screen = BookView()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpData()
    }
}

extension BookViewController {
    private func setUpData() {
        screen?.bookImage.kf.setImage(with: URL(string: bookImg))
        screen?.titleLabel.text = bookTitle
        screen?.publicacaoLabel.text = bookPubli
        screen?.sinopseLabel.text = bookSinopse
    }
}
