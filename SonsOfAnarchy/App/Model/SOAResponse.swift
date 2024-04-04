//
//  SOAResponse.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 25/03/24.
//

import Foundation

// MARK: - SOAResponseElement
//struct SOAResponse: Codable {
//    let aliases: [String]
//    let club, firstName, fullName: String
//    let gender: Gender
//    let id: Int
//    let image: String
//    let lastName: String
//    let middleName: MiddleName
//    let occupation: String
//    let playedBy, titles: [String]
//    
//    struct Gender: Codable {
//        let female: String
//        let male: String
//        
//        enum CodingKeys: String, CodingKey {
//            case female = "Female"
//            case male = "Male"
//        }
//    }
//    
//    struct MiddleName: Codable {
//        let cherry: String
//        let empty: String
//        let nathaniel: String
//        
//        enum CodingKeys: String, CodingKey {
//            case cherry = "Cherry"
//            case empty = ""
//            case nathaniel = "Nathaniel"
//        }
//    }
//}


// MARK: - SOAResponseElement
struct SOAResponse: Codable {
    let aliases: [String]
    let club, firstName, fullName: String
    let gender: Gender
    let id: Int
    let image: String
    let lastName: String
    let middleName: MiddleName
    let occupation: String
    let playedBy, titles: [String]
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

enum MiddleName: String, Codable {
    case cherry = "Cherry"
    case empty = ""
    case nathaniel = "Nathaniel"
}

//typealias SOAResponse = [SOAResponseElement]
