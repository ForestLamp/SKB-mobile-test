//
//  SearchResponse.swift
//  SKB mobile test
//
//  Created by Alex Ch. on 01.02.2022.
//

import Foundation

struct SearchResponse: Decodable {
   
    var name: String
    var phone: String
    var temperament: Temperament
    var biography: String
    var educationPeriod: Education
}

enum Temperament: String, Decodable {
    case choleric
    case melancholic
    case phlegmatic
    case sanguine
    
}

struct Education: Decodable {
    var start: String
    var end: String
}
