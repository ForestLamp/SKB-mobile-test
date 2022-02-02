//
//  ContactModel.swift
//  SKB mobile test
//
//  Created by Alex Ch. on 01.02.2022.
//

import Foundation

struct MainScreenContacts: Decodable {
   
    var name: String
    var phone: String?
    var temperament: String
    var biography: String
}
