//
//  DataParsing.swift
//  Set 8 JSON Project
//
//  Created by Lauren Kelz (student LM) on 1/5/22.
//

import Foundation

class FetchData : ObservableObject{
    
    var month : String
    var day : String
    @Published var responses = Response()
    
    // replace func getData() with initializer so that the object automatically loads data
    init(){
        guard let url = URL(string: "https://api.wikimedia.org/feed/v1/wikipedia/en/onthisday/births/\(month)/\(day)"
                            
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
    var births : [Birth] = [Birth]()
    
}

struct Birth : Codable{
    var title : String?
    var thumbnail : [Thumbnail] = [Thumbnail]()
    var age : String?
}

struct Thumbnail : Codable{
    var source : URL?
}

// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension Birth: Identifiable{
    var id: String {return title!}
}

