//
//  PaintingListViewController.swift
//  ArtGallery
//
//  Created by Jonathan T. Miles on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController, UITableViewDataSource, PaintingTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewPainting.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }

    // MARK: - Novel delegate conformance
    
    func likeButtonWasTapped(on cell: PaintingTableViewCell) {
        let indexPath = tableViewPainting.indexPath(for: UITableViewCell)
        
        let painting = paintingController.paintings[indexPath.row]
        paintingController.toggleIsLiked(for: painting)
        
        tableViewPainting.reloadRows(at: indexPath, with: UITableViewRowAnimation.bottom)
    }
    
    // MARK: - TableViewDataSource conformance
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingController.paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaintingCell", for: indexPath)
        guard let paintingCell = cell as? PaintingTableViewCell else { return cell }
        
        // directing the painting (model instance) to the cell so it can be viewed
        
        let painting = paintingController.paintings[indexPath.row]
        paintingCell.painting = painting
        
        paintingCell.delegate = self
        
        return paintingCell
    }
    
    // MARK: - Properties
    
    let paintingController = PaintingController()
    
    @IBOutlet weak var tableViewPainting: UITableView!
}
