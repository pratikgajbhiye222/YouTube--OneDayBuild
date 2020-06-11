//
//  Model.swift
//  OneDayBuild
//
//  Created by pratik gajbhiye on 11/06/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
protocol ModelDelegate {
    func getVideoFetched(_ videos : [Video])
}

class Model {
    var delegate: ModelDelegate?
    
    func getVideos(){
        guard let url = URL(string: Constants.API_URL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                if response.items != nil {
                self.delegate?.getVideoFetched(response.items!)
                dump(response)
                }
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
        
    }
    
    
}
