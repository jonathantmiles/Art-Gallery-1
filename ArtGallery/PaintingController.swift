//
//  PaintingController.swift
//  ArtGallery
//
//  Created by Jonathan T. Miles on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

import UIKit // for image manipulation

class PaintingController {
    
    // MARK: - Create & Load from file
    
    func createNewPainting(from image: UIImage) {
        let painting = Painting(image: image)
        paintings.append(painting)
        
    }
    
    func loadPaintingsFromAssets() {
        for i in 1...12 {
            let name: String = ("Image\(i)")
            guard let painting = UIImage(named: name) else { return }
            
            createNewPainting(from: painting)
        }
    }
    
    // MARK: - isLiked implementtion
    
    func toggleIsLiked(for painting: Painting) {
        painting.isLiked = !painting.isLiked
        
        /*
        if painting.isLiked == true {
            painting.isLiked = false
        } else if painting.isLiked == false {
            painting.isLiked = true
        }
        */
    }
 
 
    // MARK: - Read
    
    var paintings: [Painting] = []
    
    // MARK: - Initializer
    
    init() {
        loadPaintingsFromAssets()
    }
    
    
}
