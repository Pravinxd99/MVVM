//
//  Client.swift
//  MVVM
//
//  Created by S, Praveen (Cognizant) on 02/03/26.
//

import Foundation

class Client {
    
    func fetchDataFromApi () async throws -> DataModel {
        let initialurl = URL(string: "https://cdn.jwplayer.com/v2/playlists/GJpN5tES")
        guard let url = initialurl else {
            throw NetworkingErrors.invalidURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
            throw NetworkingErrors.invalidResponse
        }
        
        guard let fetchedData = try? JSONDecoder().decode(DataModel.self, from: data) else {
            throw NetworkingErrors.invalidData
        }
        print(fetchedData)
        return fetchedData
    }
    
    
    func parseData () async -> DataModel {
        var data : DataModel = DataModel.sampleDataModel
        let url = Bundle.main.url(forResource: "JsonData" , withExtension: "json")
        guard let unwrappedUrl = url else {
            return DataModel.sampleDataModel
        }
        do {
            let data1 = try Data(contentsOf: unwrappedUrl)
            data = try JSONDecoder().decode(DataModel.self, from: data1)
        }
        catch {
            print("Error : \(error.localizedDescription)")
        }
        return data
    }
}

enum NetworkingErrors : Error , LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case noNetwork
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidData:
            return "Invalid Data"
        case .noNetwork:
            return "No Network"
        }
    }
}
