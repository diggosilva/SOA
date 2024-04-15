//
//  DetailsViewModel.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 09/04/24.
//

import Foundation

class DetailsViewModel {
    
    private var service = Service()
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func loadDataDetails(completion: @escaping(Personagem) -> ()) {
        service.getDetails(id: id) { char in
            let selectedChar = Personagem(
                firstName: char.firstName,
                lastName: char.lastName,
                fullName: char.fullName,
                gender: char.gender,
                image: char.image,
                club: char.club,
                occupation: char.occupation,
                id: char.id,
                playedBy: char.playedBy
            )
            
            completion(selectedChar)
        } onError: { error in
            print("DEBUG: Error.. \(error.localizedDescription)")
        }
    }
}
