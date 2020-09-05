//
//  ServiceDetailViewModel.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import Foundation

final class ServiceDetailViewModel: BaseViewModel {
    
    private enum Constants {
        static let homepageRequestURL = "https://my-json-server.typicode.com/engincancan/case/service/"
    }
    
    enum Change {
        case reloadService(service: Service)
    }
    
    var stateChangeHandler: ((Change) -> (Void))?
    
    func loadServiceDetails(id: Int) {
        NetworkManager.shared.getJSON(from: "\(Constants.homepageRequestURL)\(id)") { (data) in
            let decoder = JSONDecoder()
            do {
                let service = try decoder.decode(Service.self, from: data)
                self.stateChangeHandler?(.reloadService(service: service))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
