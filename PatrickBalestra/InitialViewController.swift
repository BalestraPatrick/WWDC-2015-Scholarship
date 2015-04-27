//
//  ViewController.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 31/01/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit
import SceneKit

class InitialViewController: UIViewController {
    
    let mainScene = MainScene()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let sceneView = self.view as! SCNView
        sceneView.backgroundColor = UIColor.blackColor()
        sceneView.scene = mainScene as SCNScene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTouch:")
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
    }

    override func viewDidAppear(animated: Bool) {
        mainScene.startAnimations()
        
        let presentWelcome = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: "welcome", userInfo: nil, repeats: false)
    }
    
    // MARK: Methods
    
    func welcome() {
        self.presentViewController("Welcome")
    }
    
    func handleTouch(gestureRecognizer: UIGestureRecognizer) {

        let scnView = self.view as! SCNView
        let point = gestureRecognizer.locationInView(scnView)
        
        if let hitResults = scnView.hitTest(point, options: nil) {
            if hitResults.count > 0 {
                
                let result: AnyObject! = hitResults[0]
                let material = result.node!.geometry!.firstMaterial!
                let name = result.node!.name!
                
                // highlight it and present view controller
                SCNTransaction.begin()
                SCNTransaction.setAnimationDuration(0.5)
                SCNTransaction.setCompletionBlock {
                    SCNTransaction.begin()
                    SCNTransaction.setAnimationDuration(0.5)
                    material.emission.contents = UIColor.blackColor()
                    SCNTransaction.commit()
                    self.presentViewController(name)
                }
                material.emission.contents = UIColor(white: 0.25, alpha: 0.25)
                SCNTransaction.commit()
                
            }
        }
    }
    
    func presentViewController(identifier: String) {
        if let viewController = storyboard?.instantiateViewControllerWithIdentifier(identifier) as? UIViewController {
            presentViewController(viewController, animated: true, completion: nil)
        }
    }
    
}

