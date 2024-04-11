//
//  Service.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 25/03/24.
//

import Foundation

enum SOAEndpoints {
    case characters
    case seasons
    case episodes
    case filter
}

protocol ServiceProtocol {
    var dataTask: URLSessionTask? { get set }
    func isUpdating() -> Bool
}

final class Service: ServiceProtocol {
    var dataTask: URLSessionTask?
    
    func isUpdating() -> Bool {
        if let dataTask = dataTask {
            return dataTask.state == .running
        }
        return false
    }
    
    func getCharactersSOA(onSuccess: @escaping([DiggoResponse]) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://sons-of-anrachy-api.onrender.com/api/v1/characters") else { return }
        let urlRequest = URLRequest(url: url)
        
        dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                if let response = response as? HTTPURLResponse {
                    print("Status Code: \(response.statusCode)")
                }
                
                if let data = data {
                    do {
                        let charactersSOA = try JSONDecoder().decode([SOAResponse].self, from: data)
                        var diggoResponse: [DiggoResponse] = []
                        
                        for character in charactersSOA {
                            diggoResponse.append(DiggoResponse(firstName: character.firstName, lastName: character.lastName, image: character.image, club: character.club, occupation: character.occupation, id: character.id, playedBy: character.playedBy))
                        }
                        
                        diggoResponse = diggoResponse.sorted { (character1, character2) -> Bool in
                            return character1.firstName.caseInsensitiveCompare(character2.firstName) == .orderedAscending
                        }
                        
                        onSuccess(diggoResponse)
                        print("DEBUG: Personagens.. \(diggoResponse)")
                    } catch {
                        onError(error)
                        print("DEBUG: Erro ao decodificar o JSON: \(error.localizedDescription)")
                    }
                }
            }
        }
        dataTask?.resume()
    }
    
    func getDetails(id: Int, onSucccess: @escaping(CharSelected) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://sons-of-anrachy-api.onrender.com/api/v1/characters/\(id)") else { return }
        let urlRequest = URLRequest(url: url)
        
        dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                if let response = response as? HTTPURLResponse {
                    print("Status Code: \(response.statusCode)")
                }
                
                if let data = data {
                    do {
                        let charSOA = try JSONDecoder().decode(SOAResponse.self, from: data)
                        var diggoSelectedResponse = CharSelected(firstName: charSOA.firstName, lastName: charSOA.lastName, image: charSOA.image, club: charSOA.club, occupation: charSOA.occupation, id: charSOA.id, playedBy: charSOA.playedBy, gender: charSOA.gender.rawValue)
                        
                        onSucccess(diggoSelectedResponse)
                        print("DEBUG: Personagens.. \(diggoSelectedResponse)")
                    } catch {
                        onError(error)
                        print("DEBUG: Erro ao pegar dados do Personagem selecionado.. \(error.localizedDescription)")
                    }
                }
            }
        })
        dataTask?.resume()
    }
}
