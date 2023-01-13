//
//  Contacts.swift
//  StoryboardContacts
//
//  Created by Abdulaziz Nosirjonov on 16/02/22.
//

import Foundation

struct Contact: Decodable{

    var id: String?
    var name: String?
    var number: String?
    
    init (name: String, number: String){
        self.name = name
        self.number = number
    }
}
