//
//  AboutMeViewController.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 01/02/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    
    // MARK - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.2, green:0.381, blue:0.88, alpha:1)
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : UIFont(name: "HelveticaNeue-Light", size: 20)!]
    }
    
    override func viewDidAppear(animated: Bool) {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width, 1300)
    }
    
    // MARK - IBActions
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func openGithub(sender: LinkButton) {
        LinkOpener.Github.openURL()
    }
    
    @IBAction func sendEmail(sender: LinkButton) {
        LinkOpener.Email.openURL()
    }
    
    @IBAction func openWebsite(sender: LinkButton) {
        LinkOpener.Website.openURL()
    }
    
    @IBAction func openTwitter(sender: LinkButton) {
        LinkOpener.Twitter.openURL()
    }

    @IBAction func openFacebook(sender: LinkButton) {
        LinkOpener.Facebook.openURL()
    }
    
    // MARK - UITextViewDelegate

    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        return false
    }
    
}
