//
//  NetworkingApi.swift
//  Assignment4
//
//  Created by Dayal, Utkarsh on 18/04/21.
//

import Foundation

protocol NetwokingService{
    @discardableResult func getPokemonsList(completionHandler: @escaping (PokemonsList) -> ()) -> URLSessionDataTask
 
    @discardableResult func getUniversitiesList(completionHandler: @escaping ([Universities]) -> ()) -> URLSessionDataTask
}

final class NetworkingApi : NetwokingService{
    
    let session = URLSession.shared
    
    @discardableResult
    func getPokemonsList(completionHandler: @escaping (PokemonsList) -> ()) -> URLSessionDataTask {
        let request = URLRequest(url: URL(string: "\(POKEMON_BASE_URL)/pokemon")!)
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error accessing API with error \(error)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse , (200...299).contains(httpResponse.statusCode) else{
                    print("Response Error")
                    return
                }
                guard let data = data,
                      let result = try? JSONDecoder().decode(PokemonsList.self, from: data) else {
                    print("Failed to Decode")
                    return
                }
                completionHandler(result)
            }
        }
        task.resume()
        return task
    }
    
    @discardableResult
    func getUniversitiesList(completionHandler: @escaping ([Universities]) -> ()) -> URLSessionDataTask {
        let request = URLRequest(url: URL(string: "\(UNIVERSITIES_BASE_URL)?country=India")!)
        let task = session.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                if let error = error{
                    print("Error accessing API with error \(error)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
                    print("Response Error")
                    return
                }
                guard let data = data,
                      let result = try? JSONDecoder().decode([Universities].self, from: data) else{
                    print("Failed to Decode")
                    return
                }
                completionHandler(result)
            }
        }
        task.resume()
        return task
    }
    
    
}
