//
//  DetailsViewModel.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 09/04/24.
//

import Foundation

enum DetailsControllerStates {
    case loading
    case loaded(Personagem)
    case error(Error)
}

class DetailsViewModel {
    var state: Bindable<DetailsControllerStates> = Bindable(value: .loading)
    private var service = Service()
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func loadDataDetails() {
        service.getDetails(id: id) { char in
            self.state.value = .loaded(char)
        } onError: { error in
            self.state.value = .error(error)
        }
    }
}
