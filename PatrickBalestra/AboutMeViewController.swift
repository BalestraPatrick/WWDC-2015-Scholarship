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
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont(name: "HelveticaNeue-Light", size: 20)!]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1300)
    }
    
    // MARK - IBActions
    
    @IBAction func dismiss(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openGithub(_ sender: LinkButton) {
        LinkOpener.github.openURL()
    }
    
    @IBAction func sendEmail(_ sender: LinkButton) {
        LinkOpener.email.openURL()
    }
    
    @IBAction func openWebsite(_ sender: LinkButton) {
        LinkOpener.website.openURL()
    }
    
    @IBAction func openTwitter(_ sender: LinkButton) {
        LinkOpener.twitter.openURL()
    }

    @IBAction func openFacebook(_ sender: LinkButton) {
        LinkOpener.facebook.openURL()
    }
    
    // MARK - UITextViewDelegate

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        return false
    }
    
}
