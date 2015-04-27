//
//  ProjectTableViewCell.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 02/02/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var appStoreButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var screenshot1: UIImageView!
    @IBOutlet weak var screenshot2: UIImageView!
    @IBOutlet weak var screenshot3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = 32.0;
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.borderColor = UIColor.blackColor().CGColor
        iconImageView.layer.borderWidth = 1.0
        
        appStoreButton.layer.cornerRadius = 8.0
        appStoreButton.layer.borderColor = UIColor.blackColor().CGColor
        appStoreButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        appStoreButton.layer.borderWidth = 1.0
        
        websiteButton.layer.cornerRadius = 8.0
        websiteButton.layer.borderColor = UIColor.blackColor().CGColor
        websiteButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        websiteButton.layer.borderWidth = 1.0
    }
    
    var project :Project? {
        didSet {
            iconImageView.image = UIImage(named: project!.iconName)
            screenshot1.image = UIImage(named: project!.screenshotNames[0])
            screenshot2.image = UIImage(named: project!.screenshotNames[1])
            screenshot3.image = UIImage(named: project!.screenshotNames[2])
            nameLabel.text = project!.title
            descriptionLabel.text = project!.description
        }
    }

}
