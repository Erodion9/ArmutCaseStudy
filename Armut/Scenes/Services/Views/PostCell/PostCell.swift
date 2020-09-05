//
//  Postcell.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var post: Post?
    weak var delegate: GalleryCellDelegate?
}

//MARK: - Configure View
extension PostCell {
    
    func configureView() {
        if let post = post {
            guard let url = URL(string: post.image_url) else {
                print("Invalid URL: \(post.image_url)")
                return
            }
            titleLabel.text = post.title
            categoryLabel.text = post.category
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

//MARK: - Actions
extension PostCell {
    @IBAction func detailsButtonTapped(_ sender: Any) {
        guard let url = URL(string: post?.link ?? "") else { return }
        delegate?.showPostLink(url: url)
    }
}
