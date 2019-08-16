//
//  Song.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class SongAPI: Codable {
    var song_name: String
    var display_artist: String
    init(song_name: String, display_artist: String) {
        self.song_name = song_name
        self.display_artist = display_artist
    }
}



