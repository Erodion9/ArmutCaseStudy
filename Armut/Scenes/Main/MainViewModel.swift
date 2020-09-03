//
//  MainViewModel.swift
//  Armut
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import Foundation

final class MainViewModel: BaseViewModel {
    
    private enum Constants {
        static let homepageRequestURL = "https://my-json-server.typicode.com/engincancan/case/home"
    }
    
    enum Change {
        case reloadServices(homepageData: HomePageData)
    }
    
    var stateChangeHandler: ((Change) -> (Void))?
    
    func loadHomePageData() {
        NetworkManager.shared.getJSON(from: Constants.homepageRequestURL) { (data) in
            let decoder = JSONDecoder()
            do {
                let homepageData = try decoder.decode(HomePageData.self, from: data)
                self.stateChangeHandler?(.reloadServices(homepageData: homepageData))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
