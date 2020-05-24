//
//  HomeCollectionCell.swift
//  Carousel
//
//  Created by Alan Casas on 24/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    var interest: InterestEntity! {
        didSet {
            self.updateCell()
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateCell () {
        if let interestDes = interest {
            featuredImageView.image = UIImage(named: interestDes.featuredImageView ?? "")
            interestTitleLabel.text = interestDes.interestTitleLabel ?? ""
        } else {
            featuredImageView.image = nil
            interestTitleLabel.text = nil
        }

    }
    
}
