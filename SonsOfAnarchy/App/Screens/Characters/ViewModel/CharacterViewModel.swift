//
//  CharacterViewModel.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 03/04/24.
//

import Foundation

enum CharacterControllerStates {
    case loading
    case loaded
    case error
}

class CharacterViewModel {
    var state: Bindable<CharacterControllerStates> = Bindable(value: .loading)
    private var service = Service()
    
    var backupCharacter: [DiggoResponse] = []
    var filteredCharacters: [DiggoResponse] = []
    var filters: [Filter] = []
    
    func loadDataCharacters() {
        service.getCharactersSOA { personagens in
            self.backupCharacter = personagens
            self.filteredCharacters = self.backupCharacter
            var uniqueClub: Set<String> = []
            
            for personagem in personagens {
                uniqueClub.insert(personagem.club)
            }
            
            let clubs = Array(uniqueClub).sorted()
            print("DEBUG: Clubes: \(clubs)")
            print("DEBUG: Personagens: \(self.backupCharacter)")
            
            self.filters = clubs.map { Filter(club: $0, isSelected: true) }
            
            self.state.value = .loaded
        } onError: { error in
            self.state.value = .error
        }
    }
    
    func updateChampions(filters: [Filter]) {
        if filters.isEmpty {
            filteredCharacters = backupCharacter
           
        } else {
            self.filters = filters
            let selectedFilters = self.filters.filter({ $0.isSelected })
            let selectedClubs = selectedFilters.map({ $0.club })
            
            self.filteredCharacters = backupCharacter.filter({ selectedClubs.contains($0.club) })
            print("AQUI: \(filteredCharacters)")
        }
        self.state.value = .loaded

    }
    
    func numberOfRows() -> Int {
        return filteredCharacters.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> DiggoResponse {
        return filteredCharacters[indexPath.row]
    }
}
