//
//  SingleTon.swift
//  ProjectWithNetwork
//
//  Created by Daryna Polevyk on 16.06.2021.
//

import Foundation

class SingleTon {
    static var shared = SingleTon()
    
    var arrayText: [Message] = []     //["Hello", "Hi"]
    
    
    private init () {
       // Message(text: "HH", sender: .Server)
        
    }
}

struct Message {
    var text = ""
    var sender: SenderName?
}

enum SenderName {
    case Darina
    case Server
}
