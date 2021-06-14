//
//  DataManager.swift
//  ComineDemoApp
//
//  Created by Dayal, Utkarsh on 14/06/21.
//

import Foundation
import Combine

class DataManager{
    let link = "https://jsonplaceholder.typicode.com/users"
    var usersPublisher: AnyPublisher<[User],Error>{
        let url = URL(string: link)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
