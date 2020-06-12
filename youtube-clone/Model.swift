//
//  Model.swift
//  youtube-clone
//
//  Created by LVZ on 6/6/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import Foundation

// declare a new protocol
protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        
        // Create a URL Object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task - single call to API from URLSession Object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data  == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                }
                
                dump(response)
            }
            
            catch {
                
            }
            
        }
        
        // Kick off task
        dataTask.resume()
    }

}
