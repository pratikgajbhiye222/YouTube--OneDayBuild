//
//  Constants.swift
//  OneDayBuild
//
//  Created by pratik gajbhiye on 11/06/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation


struct Constants {
    static var API_KEY = "AIzaSyDjD9hwFuDgkQI9h_yFtkYMZI-yiZU7Kks"
    static var PLAYLIST_ID = "UUq-Fj5jknLsUf-MWSy4_brA"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
