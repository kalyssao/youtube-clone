//
//  Constants.swift
//  youtube-clone
//
//  Created by LVZ on 6/6/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyCGMIOR4I0VD_TG5tKJAzjiTirXeXWbc9c"
    static var PLAYLIST_ID = "PLMRqhzcHGw1aAzJ1jwtZeQ4YlfLI2iS30"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
