//
//  DataParsing.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/5/22.
//

import Foundation

class FetchData : ObservableObject{
    
    @Published var responses = Response()
    
    // replace func getData() with initializer so that the object automatically loads data
    init(){
        guard let url = URL(string: "https://celebrity-by-api-ninjas.p.rapidapi.com/v1/celebrity/nationality='US'/x_rapidapi-host='celebrity-by-api-ninjas.p.rapidapi.com'/x_rapidapi-key='ab85ebd589msh4b8f10eaab93246p1de429jsn679da9e74739'"
                            
) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, erros) in
            //gets data and convert to string
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.responses = response
                }
            }
            
            
        }.resume()
        
    }
    
    
}

struct Response: Codable{
    var totalResults : Int = 0
    var items : [Item] = [Item]()
    
}

struct Item : Codable{
    var name : String?
    var birthdy : String?
    var age : String?
}

// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension Birthdays: Identifiable{
    var id: String {return name!}
}

