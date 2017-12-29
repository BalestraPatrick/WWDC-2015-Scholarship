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
        sceneView.backgroundColor = UIColor.black
        sceneView.scene = mainScene as SCNScene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTouch(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        mainScene.startAnimations()
        
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(welcome), userInfo: nil, repeats: false)
    }
    
    // MARK: Methods
    
    @objc func welcome() {
        self.presentViewController("Welcome")
    }
    
    @objc func handleTouch(_ gestureRecognizer: UIGestureRecognizer) {

        let scnView = self.view as! SCNView
        let point = gestureRecognizer.location(in: scnView)
        
        let hitResults = scnView.hitTest(point, options: nil)
        if hitResults.count > 0 {
                
            let result: AnyObject! = hitResults[0]
            let material = result.node!.geometry!.firstMaterial!
            let name = result.node!.name!
                
            // highlight it and present view controller
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            SCNTransaction.completionBlock = {() -> Void in
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                material.emission.contents = UIColor.black
                SCNTransaction.commit()
                self.presentViewController(name)
            }
            material.emission.contents = UIColor(white: 0.25, alpha: 0.25)
            SCNTransaction.commit()
                
        }
    }
    
    func presentViewController(_ identifier: String) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: identifier) {
            present(viewController, animated: true, completion: nil)
        }
    }
    
}

