//
//  DetailsViewModel.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 09/04/24.
//

import Foundation

class DetailsViewModel {
//    var diggoResponse: DiggoResponse
//    var charSelected: CharSelected
    
    private var service = Service()
    
    var id: Int
    
    init(id: Int) {
//        self.diggoResponse = diggoResponse
//        self.charSelected = charSelected
        self.id = id
    }
    
    func loadDataDetails(id: Int) {
        service.getDetails(id: id) { char in
            var selectedChar = Personagem(
                firstName: char.firstName,
                lastName: char.lastName,
                gender: char.gender,
                image: char.image,
                club: char.club,
                occupation: char.occupation,
                id: char.id,
                playedBy: char.playedBy
            )
        } onError: { error in
            print("DEBUG: Error.. \(error.localizedDescription)")
        }
    }
}
