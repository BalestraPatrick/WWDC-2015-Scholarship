//
//  Achievement.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 02/02/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class Achievement {
    
    var title :String
    var description :String
    var images :[String]
    
    init(title: String, description: String, images: [String]) {
        self.title = title
        self.description = description
        self.images = images
    }
}
