//
//  Videos.swift
//  OneDayBuild
//
//  Created by pratik gajbhiye on 11/06/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation

struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys : String , CodingKey {
    
        case videoId , title , description , snippet , thumbnails , high , resourceId
        case thumbnail = "url"
        case published = "publishedAt"
        
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        //parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        //parse publishdate
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //parse thumbnail
        
        let thaumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thaumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourseContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourseContainer.decode(String.self, forKey: .videoId)
        
    }
    
    
}
