//
//  TrendingServicesCell.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class TrendingServicesCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var prosNearLabel: UILabel!
    
    var service: Service?
}

//MARK: - Configure View
extension TrendingServicesCell {
    
    func configureView() {
        if let service = service {
            guard let name = service.name,
                let proCount = service.pro_count,
                let url = URL(string: service.image_url ?? "")
                else { return }
            titleLabel.text = name
            prosNearLabel.text = String(proCount)
            loadImage(url: url)
        }
    }
    
    private func loadImage(url: URL) {
        let session = URLSession(configuration: .default)

        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: imageData)
                        }
                        // Do something with your image.
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
