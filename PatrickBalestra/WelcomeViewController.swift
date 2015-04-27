//
//  WelcomeViewController.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 25/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: "dismiss:")
        self.view.addGestureRecognizer(tapGesture)
    }

    @IBAction func dismiss(tapGesture: UITapGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
