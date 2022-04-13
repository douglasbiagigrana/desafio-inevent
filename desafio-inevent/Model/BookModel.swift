//
//  BookModel.swift
//  desafio-inevent
//
//  Created by Douglas Biagi Grana on 11/04/22.
//

import Foundation

struct WelcomeBook: Codable {
    let books: [Book]
}

struct Book: Codable {
    let titulo: String
    let subTitulo: String?
    let dataPublicacao: String
    let sinopse: String
    let imagens: Imagens

    enum CodingKeys: String, CodingKey {
        case titulo
        case subTitulo = "subtitulo"
        case dataPublicacao = "data_publicacao"
        case sinopse
        case imagens
    }
}

struct Imagens: Codable {
    let imagemPrimeiraCapa: Imagem

    enum CodingKeys: String, CodingKey {
        case imagemPrimeiraCapa = "imagem_primeira_capa"
    }
}

struct Imagem: Codable {
    let pequena: String
}
