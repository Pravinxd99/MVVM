//
//  DataModel.swift
//  MVVM
//
//  Created by S, Praveen (Cognizant) on 02/03/26.
//

import Foundation

struct DataModel :  Codable {
    let playlist : [PlayList]
    init(playlist: [PlayList]) {
        self.playlist = playlist
    }
   
    static let sampleDataModel : DataModel = DataModel(playlist: PlayList.samplePlaylistArray)
}

struct PlayList : Identifiable , Codable {
    var id : String {
        return mediaid
    }
    let title : String
    let mediaid : String
    
    static let samplePlaylist = PlayList(title: "Movie1", mediaid: "1234")
    static let samplePlaylistArray : [PlayList] = [ PlayList(title: "Movie1", mediaid: "1234"),
                                                    PlayList(title: "Movie2", mediaid: "12345")]
}
