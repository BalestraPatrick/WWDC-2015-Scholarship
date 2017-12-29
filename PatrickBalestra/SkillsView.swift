//
//  SkillsView.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 22/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class SkillsView: UIView {
    
    let height = CGFloat(25.0)
    
    var skills = [String]() {
        didSet {
            setUp()
        }
    }

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
        self.backgroundColor = .clear
        
        var frameX = CGFloat(0.0)
        
        for i in  0...skills.count {
        //for var i = 0; i < count(skills); i++ {
            let skill = skills[i]
            let label = UILabel(frame: CGRect(x: frameX, y: 0, width: 0, height: 0))
            label.text = skill
            label.textAlignment = .center
            label.textColor = .black
            label.layer.borderColor = UIColor.black.cgColor
            label.layer.borderWidth = 1.0
            label.sizeToFit()
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 5.0
            label.frame.size.width += 10
            label.frame.size.height = height
            frameX += label.frame.size.width + 5
            self.addSubview(label)
        }
    }

}
