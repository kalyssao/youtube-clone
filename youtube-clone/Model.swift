//
//  Model.swift
//  youtube-clone
//
//  Created by LVZ on 6/6/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL Object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        print("created session")
        // Get a URLSession object
        let session = URLSession.shared
        
        print("data task.")
        // Get a data task - single call to API from URLSession Object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data  == nil {
                return
            }
            
            // Parsing the data into video objects
            
            print(response)
        }
        
        // Kick off task
        
    }

}
