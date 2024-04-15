//
//  DiggoResponse.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 25/03/24.
//

import Foundation

struct PersonagemResponse: Codable {
    let firstName: String
    let lastName: String
    let fullName: String
    let gender: String
    let image: String
    let club: String
    let occupation: String
    let id: Int
    let playedBy: [String]
    
    var imageChar: URL? {
        return URL(string: image)
    }
}

struct Personagem: Codable {
    let firstName: String
    let lastName: String
    let fullName: String
    let gender: String
    let image: String
    let club: String
    let occupation: String
    let id: Int
    let playedBy: [String]
    
    var imageChar: URL? {
        return URL(string: image)
    }
}
