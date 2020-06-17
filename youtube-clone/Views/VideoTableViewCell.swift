//
//  VideoTableViewCell.swift
//  youtube-clone
//
//  Created by LVZ on 6/17/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        
        self.video = v
        
        // Ensure we have a video
        guard self.video != nil else {
            return
        }
        
        // Set title
        self.titleLabel.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
            
        }
        
        // Download thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) {
            (data, response, error) in
            if error == nil && data != nil {
                
                // Save data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check if video thumbail url matches video url
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell is with new video
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        
        dataTask.resume()
    
    }

}
