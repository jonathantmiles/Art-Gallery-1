//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by Jonathan T. Miles on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingTableViewCell: UITableViewCell {

    @IBAction func likeOrUnlikeButton(_ sender: Any) {
    }
    
    private func updateViews() {
        guard let painting = painting else { return }
        paintingView.image = painting.image
        likeButton.setTitle(<#T##title: String?##String?#>, for: <#T##UIControlState#>)
    }
    
    // MARK: - Properties
    
    var painting: Painting? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var paintingView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
}
