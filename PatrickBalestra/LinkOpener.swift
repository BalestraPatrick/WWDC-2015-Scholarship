//
//  URLs.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 16/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

enum LinkOpener {
    case Github
    case Email
    case Website
    case Twitter
    case Facebook
    
    func openURL() {
        switch self {
        case .Github:
            UIApplication.sharedApplication().openURL(NSURL(string: "http://www.github.com/BalestraPatrick")!)
        case .Email:
            UIApplication.sharedApplication().openURL(NSURL(string: "mailto:me@patrickbalestra.com")!)
        case .Website:
            UIApplication.sharedApplication().openURL(NSURL(string: "http://www.patrickbalestra.com")!)
        case .Twitter:
            UIApplication.sharedApplication().openURL(NSURL(string: "http://www.twitter.com/BalestraPatrick")!)
        case .Facebook:
            UIApplication.sharedApplication().openURL(NSURL(string: "http://www.facebook.com/BalestraPatrick15")!)
        }
    }
}
