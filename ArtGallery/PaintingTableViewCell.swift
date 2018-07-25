//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by Jonathan T. Miles on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol PaintingTableViewCellDelegate: class {
    func likeButtonWasTapped(on cell: PaintingTableViewCell)
}

class PaintingTableViewCell: UITableViewCell, PaintingTableViewCellDelegate {

    func likeButtonWasTapped(on cell: PaintingTableViewCell) {
        
    }
    
    @IBAction func likeOrUnlikeButton(_ sender: Any) {
        delegate?.likeButtonWasTapped(on: self)
    }
    
    private func updateViews() {
        guard let painting = painting else { return }
        paintingView.image = painting.image
        if painting.isLiked == true {
            likeButton.setTitle("Unlike", for: .normal)
        } else {
            likeButton.setTitle("Like", for: .normal)
        }
    }
    
    // MARK: - Properties
    
    weak var delegate: PaintingTableViewCellDelegate?
    
    var painting: Painting? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var paintingView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
}
