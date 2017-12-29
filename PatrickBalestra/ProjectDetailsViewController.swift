//
//  ProjectDetailsViewController.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 20/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit
import StoreKit

class ProjectDetailsViewController: UIViewController, SKStoreProductViewControllerDelegate {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var skillsView: SkillsView!
    @IBOutlet weak var appTextView: UITextView!
    @IBOutlet weak var firstScreenshot: UIImageView!
    @IBOutlet weak var secondScreenshot: UIImageView!
    @IBOutlet weak var thirdScreenshot: UIImageView!
    
    @IBOutlet weak var viewInAppStore: LinkButton!
    @IBOutlet weak var viewWebsite: LinkButton!
    
    var project: Project?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont(name: "HelveticaNeue-Light", size: 20)!]
        
        self.title = self.project?.title
        self.iconImageView.image = UIImage(named: self.project?.iconName ?? "")
        self.titleLabel.text = self.project?.title
        self.descriptionLabel.text = self.project?.subtitle
        self.dateLabel.text = self.project?.date
        self.appTextView.text = self.project?.description
        self.firstScreenshot.image = UIImage(named: self.project!.screenshotNames[0])
        self.secondScreenshot.image = UIImage(named: self.project!.screenshotNames[1])
        self.thirdScreenshot.image = UIImage(named: self.project!.screenshotNames[2])
        self.skillsView.skills = self.project!.skills
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.navigationController?.navigationBar.barTintColor = self.project?.appColor
        })
        
        self.iconImageView.layer.shadowColor = UIColor.black.cgColor
        self.iconImageView.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.iconImageView.layer.shadowOpacity = 0.25
        
        self.viewInAppStore.backgroundColor = self.project?.appColor
        self.viewInAppStore.setTitleColor(UIColor.black, for: .normal)
        
        self.viewWebsite.backgroundColor = self.project?.appColor
        if self.project?.title == "Notes for Watch" {
            self.viewWebsite.setTitleColor(UIColor.black, for: .normal)
            self.viewInAppStore.setTitleColor(UIColor.black, for: .normal)
        } else {
            self.viewWebsite.setTitleColor(UIColor.white, for: .normal)
            self.viewInAppStore.setTitleColor(UIColor.white, for: .normal)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.navigationController?.navigationBar.barTintColor = UIColor(red:0.202, green:0.808, blue:0.459, alpha:1)
        })
    }
    
    // MARK: IBActions
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func viewInAppStore(sender: AnyObject) {
        self.openProjectInAppStore(self.project!.iTunesID)
    }
    
    @IBAction func viewWebsite(sender: AnyObject) {
        let URL = self.project!.websiteLink
        UIApplication.shared.openURL(URL)
    }
    
    // MARK: Methods
    
    func openProjectInAppStore(_ appID: String) {
        let viewController: SKStoreProductViewController = SKStoreProductViewController()
        let parameters = [
            SKStoreProductParameterITunesItemIdentifier : appID,
        ]
        viewController.delegate = self
        viewController.loadProduct(withParameters: parameters, completionBlock: { (completed, error) -> Void in
            print(error ?? "ok")
        })
        self.present(viewController, animated: true) { () -> Void in }
    }
    
    // MARK: SKStoreProductViewControllerDelegate
    
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }

}
