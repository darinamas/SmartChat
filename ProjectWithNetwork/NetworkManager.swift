//
//  File.swift
//  ProjectWithNetwork
//
//  Created by Daryna Polevyk on 16.06.2021.
//

import Foundation

class NetworkManager {
    
    func get(complitionHandler: @escaping ([String]) -> ()) {
        //let task = URLSession.shared.dataTask(with: URL(string: "https://random-word-api.herokuapp.com/word?number=10")!)  //sozdajet zadachu, poluchaet dannye
        let numberOfStr:Int = Int.random(in: 1...3)
        let task =  URLSession.shared.dataTask(with: URL(string: "https://random-word-api.herokuapp.com/word?number=\(numberOfStr)")!) { data, response, error in
            
//            let dataString = String(data: data!, encoding: .utf8) // convertaciya v string
            
            do {
                let array = try JSONDecoder().decode([String].self, from: data!)//
                complitionHandler(array) //!!
                //print(array)
            } catch {
                print("Error")
            }  // obrabotka error

            
            //print(dataString)
        } // data - dannye s servera, urlresponse - status code, error = error skoree na storone klienta. data prichodyat v bytes
        task.resume()  //otdelnyj potok background potok
      
    }
    
}
//parsing = sobirajet i systematiz dannye

//: DU add presenter
