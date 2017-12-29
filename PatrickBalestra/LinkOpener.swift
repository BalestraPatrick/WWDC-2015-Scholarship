//
//  URLs.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 16/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

enum LinkOpener {
    case github
    case email
    case website
    case twitter
    case facebook
    
    func openURL() {
        switch self {
        case .github:
            UIApplication.shared.openURL(URL(string: "http://www.github.com/BalestraPatrick")!)
        case .email:
            UIApplication.shared.openURL(URL(string: "mailto:me@patrickbalestra.com")!)
        case .website:
            UIApplication.shared.openURL(URL(string: "http://www.patrickbalestra.com")!)
        case .twitter:
            UIApplication.shared.openURL(URL(string: "http://www.twitter.com/BalestraPatrick")!)
        case .facebook:
            UIApplication.shared.openURL(URL(string: "http://www.facebook.com/BalestraPatrick15")!)
        }
    }
}
