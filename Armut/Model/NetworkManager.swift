//
//  NetworkManager.swift
//  Armut
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    
    /// Get JSON file from url.
    /// - Parameter url: url to request to.
    func getJSON(from url: String, completion: @escaping (Data) -> ())
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()

    func getJSON(from url: String, completion: @escaping (Data) -> ()) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            completion(data)
        }
        task.resume()
    }
}
