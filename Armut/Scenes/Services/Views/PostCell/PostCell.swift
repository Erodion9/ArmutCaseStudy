//
//  Postcell.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class PostCell: GalleryCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var post: Post?
}

//MARK: - Configure View
extension PostCell {
    
    func configureView() {
        if let post = post {
            guard let url = URL(string: post.image_url) else {
                print("Invalid Image URL: \(post.image_url)")
                return
            }
            titleLabel.text = post.title
            categoryLabel.text = post.category
            loadImage(url: url)
        }
    }
}

//MARK: - Actions
extension PostCell {
    @IBAction func detailsButtonTapped(_ sender: Any) {
        guard let url = URL(string: post?.link ?? "") else { return }
        delegate?.showPostLink(url: url)
    }
}
