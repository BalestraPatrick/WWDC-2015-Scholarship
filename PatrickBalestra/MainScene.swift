//
//  MainScene.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 31/01/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit
import SceneKit

class MainScene: SCNScene {
    
    var aboutMeNode :SCNNode = SCNNode()
    var projectsNode :SCNNode = SCNNode()
    var achievementsNode :SCNNode = SCNNode()
    var interestsNode :SCNNode = SCNNode()
    
    override init() {
        super.init()
        
        // About me
        let aboutMeCube = SCNBox(width: 6.5, height: 6.5, length: 6.5, chamferRadius: 1.0)
        let aboutMeMaterial = SCNMaterial()
        aboutMeMaterial.diffuse.contents = UIImage(named: "AboutMe")
        aboutMeCube.materials = [aboutMeMaterial]
        
        // About me node
        aboutMeNode = SCNNode(geometry: aboutMeCube)
        aboutMeNode.name = "AboutMe"
        aboutMeNode.rotation = SCNVector4(x: 0.0, y: 0.0, z: 0.0, w: Float(M_PI/5.0))
        aboutMeNode.position = SCNVector3(x: -11, y: 0.0, z: 0.0)
        aboutMeNode.opacity = 0.0
        self.rootNode.addChildNode(aboutMeNode)
        
        // Projects
        let projectsCube = SCNBox(width: 7.0, height: 7.0, length: 7.0, chamferRadius: 1.0)
        let projectsMaterial = SCNMaterial()
        projectsMaterial.diffuse.contents = UIImage(named: "Projects")
        projectsCube.materials = [projectsMaterial]
        
        // Projects node
        projectsNode = SCNNode(geometry: projectsCube)
        projectsNode.name = "Projects"
        projectsNode.rotation = SCNVector4(x: 0.0, y: 0.3, z: 0.0, w: 0.0)
        projectsNode.position = SCNVector3(x: 0.0, y: 0.5, z: 0.0)
        projectsNode.opacity = 0.0
        self.rootNode.addChildNode(projectsNode)
        
        // Achievements
        let achievementsCube = SCNBox(width: 6.0, height: 6.0, length: 6.0, chamferRadius: 1.0)
        let achievementsMaterial = SCNMaterial()
        achievementsMaterial.diffuse.contents = UIImage(named: "Achievements")
        achievementsCube.materials = [achievementsMaterial]
        
        // Achievements node
        achievementsNode = SCNNode(geometry: achievementsCube)
        achievementsNode.name = "Achievements"
        achievementsNode.rotation = SCNVector4(x: 0.0, y: 0.0, z: 0.0, w: -Float(M_PI/5.0))
        achievementsNode.position = SCNVector3(x: 10.0, y: -0.5, z: 1.0)
        achievementsNode.opacity = 0.0
        self.rootNode.addChildNode(achievementsNode)
        
        // Interests
        let interestsCube = SCNBox(width: 7.0, height: 7.0, length: 7.0, chamferRadius: 1)
        let interestsMaterial = SCNMaterial()
        interestsMaterial.diffuse.contents = UIImage(named: "Interests")
        interestsCube.materials = [interestsMaterial]
        
        // Interests node
        interestsNode = SCNNode(geometry: interestsCube)
        interestsNode.name = "Interests"
        interestsNode.rotation = SCNVector4(x: 0.0, y: 0.0, z: 0.0, w: -Float(M_PI/5.0))
        interestsNode.position = SCNVector3(x: 20.0, y: 0.0, z: 1.0)
        interestsNode.opacity = 0.0
        self.rootNode.addChildNode(interestsNode)
        
        // Camera settings
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.rotation = SCNVector4(x: 0.3, y: 0.0, z: 0.0, w: -atan2(0.0, 0.5))
        cameraNode.position = SCNVector3(x: 5.0, y: 0.0, z: 30.0)
        self.rootNode.addChildNode(cameraNode)
        
        // Light
        let light = SCNLight()
        light.type = SCNLightTypeAmbient
        light.color = UIColor(white: 0.25, alpha: 0.5)

        // Light node
        let lightNode = SCNNode()
        lightNode.light = light
        self.rootNode.addChildNode(lightNode)
        
        // Set backgorund skybox
        self.background.contents = ["BackgroundPattern.png", "BackgroundPattern.png", "BackgroundPattern.png", "BackgroundPattern.png", "BackgroundPattern.png", "BackgroundPattern.png"]
    }
    
    func startAnimations() {

        // About animations
        let aboutXAnimation = CABasicAnimation(keyPath: "position.x")
        aboutXAnimation.fromValue = -30.0
        aboutXAnimation.toValue = -11.0
        aboutXAnimation.duration = 1.0
        aboutXAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.5, 1, 1)
        aboutMeNode.addAnimation(aboutXAnimation, forKey: "aboutXAnimation")
        
        let aboutOpacityLeft = CABasicAnimation(keyPath: "opacity")
        aboutOpacityLeft.fromValue = 0.0
        aboutOpacityLeft.toValue = 1.0
        aboutOpacityLeft.duration = 1.0
        aboutOpacityLeft.fillMode = kCAFillModeForwards;
        aboutOpacityLeft.removedOnCompletion = false;
        aboutMeNode.addAnimation(aboutOpacityLeft, forKey: "aboutOpacityLeft")
        
        // Projects animations
        let projectYAnimation = CABasicAnimation(keyPath: "position.y")
        projectYAnimation.fromValue = 20.0
        projectYAnimation.toValue = 0.5
        projectYAnimation.duration = 1.0
        projectYAnimation.beginTime = CACurrentMediaTime() + 0.4
        projectYAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.5, 1, 1)
        projectsNode.addAnimation(projectYAnimation, forKey: "projectYAnimation")
        
        let projectOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        projectOpacityAnimation.fromValue = 0.0
        projectOpacityAnimation.toValue = 1.0
        projectOpacityAnimation.duration = 1.0
        projectOpacityAnimation.beginTime = CACurrentMediaTime() + 0.4
        projectOpacityAnimation.fillMode = kCAFillModeForwards;
        projectOpacityAnimation.removedOnCompletion = false;
        projectsNode.addAnimation(projectOpacityAnimation, forKey: "projectOpacityAnimation")

        // Achievements animations
        let achievementsYAnimation = CABasicAnimation(keyPath: "position.y")
        achievementsYAnimation.fromValue = -30.0
        achievementsYAnimation.toValue = -0.5
        achievementsYAnimation.duration = 1.0
        achievementsYAnimation.beginTime = CACurrentMediaTime() + 0.8
        achievementsYAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.5, 1, 1)
        achievementsNode.addAnimation(achievementsYAnimation, forKey: "achievementsYAnimation")
        
        let achievementsOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        achievementsOpacityAnimation.fromValue = 0.0
        achievementsOpacityAnimation.toValue = 1.0
        achievementsOpacityAnimation.duration = 1.0
        achievementsOpacityAnimation.beginTime = CACurrentMediaTime() + 0.8
        achievementsOpacityAnimation.fillMode = kCAFillModeForwards;
        achievementsOpacityAnimation.removedOnCompletion = false;
        achievementsNode.addAnimation(achievementsOpacityAnimation, forKey: "alphaAnimationRight")
        
        // Interests animations
        let interestsXAnimation = CABasicAnimation(keyPath: "position.x")
        interestsXAnimation.fromValue = 30.0
        interestsXAnimation.toValue = 20.0
        interestsXAnimation.duration = 1.0
        interestsXAnimation.beginTime = CACurrentMediaTime() + 1.2
        interestsXAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.5, 1, 1)
        interestsNode.addAnimation(interestsXAnimation, forKey: "interestsXAnimation")
        
        let interestsOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        interestsOpacityAnimation.fromValue = 0.0
        interestsOpacityAnimation.toValue = 1.0
        interestsOpacityAnimation.duration = 1.0
        interestsOpacityAnimation.beginTime = CACurrentMediaTime() + 1.2
        interestsOpacityAnimation.fillMode = kCAFillModeForwards;
        interestsOpacityAnimation.removedOnCompletion = false;
        interestsNode.addAnimation(interestsOpacityAnimation, forKey: "interestsOpacityAnimation")

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
