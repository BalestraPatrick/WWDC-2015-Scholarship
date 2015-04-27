//
//  Project.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 01/02/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class Project {
    
    var description: String
    var subtitle: String
    var title: String
    var iconName: String
    var screenshotNames: [String]
    var websiteLink: NSURL
    var iTunesID: String
    var date: String
    var skills: [String]
    var appColor: UIColor
    
    init(title: String, subtitle: String, description: String, iconName: String, screenshotNames: [String], websiteLink: NSURL, iTunesID: String, date: String, skills: [String], appColor: UIColor) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.iconName = iconName
        self.screenshotNames = screenshotNames
        self.websiteLink = websiteLink
        self.iTunesID = iTunesID
        self.date = date
        self.skills = skills
        self.appColor = appColor
    }
}
