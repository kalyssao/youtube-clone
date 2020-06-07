//
//  ViewController.swift
//  youtube-clone
//
//  Created by LVZ on 6/6/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
    }


}

