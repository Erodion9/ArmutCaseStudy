//
//  ServiceDetailViewController.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class ServiceDetailViewController: BaseViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var proCountLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var jobCompletedLabel: UILabel!

    var viewModel = ServiceDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

//MARK: - View Configuration
extension ServiceDetailViewController {
    
    func configureView() {
        viewModel.stateChangeHandler = { [weak self] change in
        self?.apply(change: change)
        }
        if let passedParameters = passedParameters as? (id: Int, image: UIImage) {
            imageView.image = passedParameters.image
            viewModel.loadServiceDetails(id: passedParameters.id)
        }
    }
    
    func reloadServiceData(service: Service) {
        guard let rating = service.average_rating, let completedJobs = service.completed_jobs_on_last_month else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = service.name
            self.proCountLabel.text = String(service.pro_count)
            self.ratingLabel.text = String(rating)
            self.jobCompletedLabel.text = "Last month \(completedJobs) job(s) completed."
        }
    }
}

// MARK: - State Change Handling
private extension ServiceDetailViewController {

    func apply(change: ServiceDetailViewModel.Change) {
        switch change {
        case .reloadService(service: let service):
            reloadServiceData(service: service)
            break
        }
    }
}
