//
//  TrendingServicesCell.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class ServiceCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
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
    
    private func loadImage(url: URL) {
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
            if let e = error {
                print("Error downloading picture: \(e)")
            } else {
                if let res = response as? HTTPURLResponse {
                    print("Downloaded picture with response code \(res.statusCode)")
                    if let imageData = data {
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: imageData)
                        }
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        downloadPicTask.resume()
    }
}
