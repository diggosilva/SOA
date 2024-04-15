//
//  Service.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 25/03/24.
//

import Foundation

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
    
    func getCharactersSOA(onSuccess: @escaping([PersonagemResponse]) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://sons-of-anrachy-api.onrender.com/api/v1/characters") else { return }
        let urlRequest = URLRequest(url: url)
        
        dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("Status Code: \(response.statusCode)")
                }
                
                if let data = data {
                    do {
                        let responseBackEnd = try JSONDecoder().decode([ResponseBackEnd].self, from: data)
                        var personagemResponse: [PersonagemResponse] = []
                        
                        for response in responseBackEnd {
                            personagemResponse.append(
                                PersonagemResponse(firstName: response.firstName, lastName: response.lastName, fullName: response.fullName, gender: response.gender.rawValue, image: response.image, club: response.club, occupation: response.occupation, id: response.id, playedBy: response.playedBy)
                            )
                        }
                        onSuccess(personagemResponse)
                        print("DEBUG: Personagens.. \(personagemResponse)")
                    } catch {
                        onError(error)
                        print("DEBUG: Erro ao decodificar o JSON: \(error.localizedDescription)")
                    }
                }
            }
        }
        dataTask?.resume()
    }
    
    func getDetails(id: Int, onSucccess: @escaping(Personagem) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: "https://sons-of-anrachy-api.onrender.com/api/v1/characters/\(id)") else { return }
        let urlRequest = URLRequest(url: url)
        
        dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("Status Code: \(response.statusCode)")
                }
                
                if let data = data {
                    do {
                        let personagemResponse = try JSONDecoder().decode(PersonagemResponse.self, from: data)
                        let personagem = Personagem(firstName: personagemResponse.firstName, lastName: personagemResponse.lastName, fullName: personagemResponse.fullName, gender: personagemResponse.gender, image: personagemResponse.image, club: personagemResponse.club, occupation: personagemResponse.occupation, id: personagemResponse.id, playedBy: personagemResponse.playedBy)
                        
                        onSucccess(personagem)
                        print("DEBUG: Personagens.. \(personagem)")
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
