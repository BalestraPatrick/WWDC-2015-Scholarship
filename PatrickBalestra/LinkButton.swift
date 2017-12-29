//
//  LinkButton.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 15/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

@IBDesignable class LinkButton: SpringButton {
    
    // MARK - Properties
    @IBInspectable var defaultBackgroundColor: UIColor = UIColor.black {
        didSet {
            self.backgroundColor = defaultBackgroundColor
        }
    }
    
    private var pressedRedColor: CGFloat = 0.0
    private var pressedGreenColor: CGFloat = 0.0
    private var pressedBlueColor: CGFloat = 0.0
    private var pressedAlpha: CGFloat = 0.0
    
    // MARK - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setUp()
    }
    
    private func setUp() {
        self.layer.cornerRadius = 10.0
        self.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        self.setTitleColor(UIColor.white, for: .normal)
        self.setNeedsDisplay()
    }
    
}
