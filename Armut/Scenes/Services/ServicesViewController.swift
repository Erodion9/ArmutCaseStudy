//
//  ViewController.swift
//  Armut
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class ServicesViewController: BaseViewController {
    
    private var homepageData = HomePageData()
    private var viewModel = ServicesViewModel()
    @IBOutlet weak var trendingServicesView: GalleryView!
    @IBOutlet weak var otherView: GalleryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

//MARK: - View Configuration
extension ServicesViewController {
    
    private func configureView() {
        viewModel.stateChangeHandler = { [weak self] change in
        self?.apply(change: change)
        }
        
        viewModel.loadHomePageData()
    }

    private func reloadHomepageData(data: HomePageData) {
        homepageData = data
        DispatchQueue.main.async {
            self.updateGalleries()
        }
    }
    
    private func updateGalleries() {
        trendingServicesView.setContents(contents: self.homepageData.trending ?? [Displayable]())
        otherView.setContents(contents: self.homepageData.other ?? [Displayable]())
    }
}

// MARK: - State Change Handling
private extension ServicesViewController {

    func apply(change: ServicesViewModel.Change) {
        switch change {
        case .reloadServices(homepageData: let homepageData):
            self.reloadHomepageData(data: homepageData)
        }
    }
}
