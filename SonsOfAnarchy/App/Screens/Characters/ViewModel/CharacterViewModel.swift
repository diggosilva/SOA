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
    
    var backupCharacter: [PersonagemResponse] = []
    var filteredCharacters: [PersonagemResponse] = []
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
            
            self.filters = clubs.map { Filter(club: $0, isSelected: true) }
            
            self.state.value = .loaded
        } onError: { error in
            self.state.value = .error
        }
    }
    
    func updateChampions(filters: [Filter]) {
            self.filters = filters
            let selectedFilters = self.filters.filter({ $0.isSelected })
            let selectedClubs = selectedFilters.map({ $0.club })
            
            self.filteredCharacters = backupCharacter.filter({ selectedClubs.contains($0.club) })
       
        self.state.value = .loaded
    }
    
    func numberOfRows() -> Int {
        return filteredCharacters.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> PersonagemResponse {
        return filteredCharacters[indexPath.row]
    }
    
    func didSelectItemAt(indexPath: IndexPath) -> PersonagemResponse {
        return filteredCharacters[indexPath.row]
    }
}
