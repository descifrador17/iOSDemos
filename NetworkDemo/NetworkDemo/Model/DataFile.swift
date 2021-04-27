//
//  DataFile.swift
//  NetworkDemo
//
//  Created by Dayal, Utkarsh on 14/04/21.
//

import Foundation

struct Response:Codable{
    let results : MyResult
    let status : String
}

struct MyResult : Codable {
    let sunrise : String
    let sunset : String
    let solar_noon : String
    let day_length : Int
    let civil_twilight_begin : String
    let civil_twilight_end : String
    let nautical_twilight_begin : String
    let nautical_twilight_end : String
    let astronomical_twilight_begin : String
    let astronomical_twilight_end : String
    
}
