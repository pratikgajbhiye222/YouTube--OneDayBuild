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
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
         
         return cell 
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    


}

