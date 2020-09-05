//
//  ViewController.swift
//  Armut
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

protocol GalleryViewDelegate: class {
    
    func showServiceDetail(id: Int)
    func showPostLink(url: URL)
}

final class ServicesViewController: BaseViewController {
    
    private var homepageData = HomePageData()
    private var viewModel = ServicesViewModel()
    @IBOutlet weak var trendingServicesView: ServicesView!
    @IBOutlet weak var otherView: ServicesView!
    @IBOutlet weak var postsView: PostsView!
    
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
        
        trendingServicesView.delegate = self
        otherView.delegate = self
        postsView.delegate = self
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
        postsView.setContents(contents: self.homepageData.posts ?? [Displayable]())
    }
}

//MARK: - GalleryViewDelegate
extension ServicesViewController: GalleryViewDelegate {

    func showServiceDetail(id: Int) {
        //Redirect to detailed view
        print("Id to be shown detail of: \(id)")
    }
    
    func showPostLink(url: URL) {
        //Show post webpage
        print("Post to be redirected \(url.absoluteString)")
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
