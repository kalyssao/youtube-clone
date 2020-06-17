//
//  CacheManager.swift
//  youtube-clone
//
//  Created by LVZ on 6/17/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import Foundation
class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data: Data?){
        
        // Store image data and use url as key
        cache[url] = data
    
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        return cache[url]
    
    }
    
}
