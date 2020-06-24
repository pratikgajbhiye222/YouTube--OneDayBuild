//
//  DetailsViewController.swift
//  OneDayBuild
//
//  Created by pratik gajbhiye on 23/06/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var textviewlabel: UITextView!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var datelabel: UILabel!
    
    var video: Video?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //check if there is video
        guard video != nil else {
            print("Video is nil")
            return
        }
        
        //clear the field
        titlelabel.text = ""
        textviewlabel.text = ""
        datelabel.text = ""
        
        //create embeded url
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        //Load it into webview
        let url = URL(string: embedUrlString)
        let urlRequest = URLRequest(url: url!)
        webview.load(urlRequest)
        
        //set the label
        titlelabel.text = video!.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        datelabel.text = df.string(from: video!.published)
        
        //set the description
        textviewlabel.text = video!.description
        
    }

}
