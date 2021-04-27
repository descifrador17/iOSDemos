//
//  NetworkingApi.swift
//  NetworkDemo
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import Foundation

protocol NetworkingService {
    @discardableResult func getSunriseSunset(completion: @escaping (Response) -> ()) -> URLSessionDataTask
}

final class NetworkingApi: NetworkingService {
    private let session = URLSession.shared
    
    @discardableResult
    func getSunriseSunset(completion: @escaping (Response) -> ()) -> URLSessionDataTask {
        let request = URLRequest(url: URL(string: "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&formatted=0")!)
        let task = session.dataTask(with: request) { (data, _, _) in
            DispatchQueue.main.async {
                guard let data = data,
                      let response = try? JSONDecoder().decode(Response.self, from: data) else {
                        return
                }
                completion(response)
            }
        }
        task.resume()
        return task
    }
}
