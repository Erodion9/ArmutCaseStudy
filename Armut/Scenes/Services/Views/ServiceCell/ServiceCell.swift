//
//  TrendingServicesCell.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class ServiceCell: GalleryCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var prosNearLabel: UILabel!
    
    var service: Service?
}

//MARK: - Configure View
extension ServiceCell {
    
    func configureView() {
        if let service = service {
            guard let url = URL(string: service.image_url) else {
                print("Invalid URL: \(service.image_url)")
                return
            }
            titleLabel.text = service.name
            prosNearLabel.text = String(service.pro_count)
            loadImage(url: url)
        }
    }
}

//MARK: - Actions
extension ServiceCell {
    @IBAction func detailsButtonTapped(_ sender: Any) {
        guard let id = service?.id else { return }
        delegate?.showServiceDetail(id: id)
    }
}
