//
//  ProjectCollectionViewCell.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 19/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameTitleLabel: UILabel!
    
    var project :Project? {
        didSet {
            iconImageView.image = UIImage(named: project?.iconName ?? "")
            nameTitleLabel.text = project?.title
        }
    }
}
