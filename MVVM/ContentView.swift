//
//  ContentView.swift
//  MVVM
//
//  Created by S, Praveen (Cognizant) on 02/03/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.playListItems.playlist) { item in
                    VStack {
                        Text(item.title)
                    }
                }
            }.navigationTitle("PlayList")
        }
    }
}

#Preview {
    ContentView()
}
