//
//  ViewTableViewCell.swift
//  OneDayBuild
//
//  Created by pratik gajbhiye on 19/06/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

class ViewTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ThumbnailImageView: UIImageView!
    var video : Video?
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ v: Video){
        self.video = v
        
        
        //Ensure that we have video
        guard self.video != nil else {
            return
        }
        
        
        // set up label
        self.titleLabel.text = video?.title
        
        //set up date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        
        //set the thumbnail
        
        guard self.video!.thumbnail != "" else {
            return
        }
       
        //url
        
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session object
        let session = URLSession.shared
        
        //Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                if url!.absoluteString != self.video?.thumbnail {
                    return
                }
                guard let image = UIImage(data: data!) else {return}
                
                DispatchQueue.main.async {
                    self.ThumbnailImageView.image = image
                }
                
            }
        }
        dataTask.resume()
        
        
    }

}
