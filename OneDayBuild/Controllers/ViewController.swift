//
//  ViewController.swift
//  OneDayBuild
//
//  Created by pratik gajbhiye on 11/06/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , ModelDelegate{
  
    
    
 
    
    @IBOutlet weak var tableView: UITableView!
    
    private var model = Model()
    private var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        // Do any additional setup after loading the view.
        model.getVideos()
        
        
    }
     //MARK: -Model delegate
    func getVideoFetched(_ videos: [Video]) {
        
        DispatchQueue.global(qos: .background).async {
            self.videos = videos
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    
    
    //MARK: -TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ViewTableViewCell
         
        let video = self.videos[indexPath.row]
        cell.setupCell(video)
         
         return cell 
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //confirm that the video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //Get the referance when the video was tapped
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // Get the referance to the detail view controller
        let detailVC = segue.destination as! DetailsViewController
        
        // Set the video property to the details view controller
        detailVC.video = selectedVideo
        
        
        
    }
    
    


}

