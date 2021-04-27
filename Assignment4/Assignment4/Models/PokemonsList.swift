//
//  PokemonsList.swift
//  Assignment4
//
//  Created by Dayal, Utkarsh on 19/04/21.
//

import Foundation

struct PokemonsList : Codable {
    var count : Int?
    var next : String?
    var previous : String?
    var results : [Pokemon]?
}

struct Pokemon : Codable{
    var name : String?
    var url : String?
}
