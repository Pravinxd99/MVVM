//
//  ViewModel.swift
//  MVVM
//
//  Created by S, Praveen (Cognizant) on 02/03/26.
//

import Foundation
@MainActor
final class ViewModel : ObservableObject {
    
    @Published var playListItems : DataModel = DataModel.sampleDataModel
    @Published var errorStateWithMessage : (String , Bool) = ("", false)
    var client : Client
    init(client : Client = Client()) {
        self.client = client
        Task {
            await fetchData()
        }
    }
    
    func fetchData () async {
        do {
            self.playListItems =  await client.parseData()
        }
    }
    
    func sortPlayList () {
       // sort using title
    }
    func filterPlayList() {
        // have another duplicate property and use duplicate property to show filtered data 
    }
    
}
