//
//  InterestsViewController.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 16/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class InterestsViewController: UIViewController {
    
    enum InterestType {
        case Sport
        case Blogger
        case Music
        case Cats
    }
    
    @IBOutlet weak var catsView: InterestView!
    @IBOutlet weak var bloggerView: InterestView!
    @IBOutlet weak var musicView: InterestView!
    @IBOutlet weak var sportView: InterestView!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.963, green:0.761, blue:0.135, alpha:1)
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : UIFont(name: "HelveticaNeue-Light", size: 20)!]
        
        self.sportView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        self.musicView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        self.catsView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        self.bloggerView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        self.addGestureRecognizers()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.sportView.transform = CGAffineTransformIdentity
        }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.2, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.musicView.transform = CGAffineTransformIdentity
        }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.4, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.catsView.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.6, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.bloggerView.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 4.0, options: nil, animations: { () -> Void in
            self.tipLabel.alpha = 0.0
            }, completion: nil)
        
    }

    // MARK: IBActions
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Methods
    
    func changeTip() {
        if let label = self.tipLabel {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.tipLabel.alpha = 0.0
                }) { (completed) -> Void in
                    self.tipLabel.text = "Pinch to close a bubble."
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.tipLabel.alpha = 1.0
                        }, completion: { (completed) -> Void in
                            UIView.animateWithDuration(0.5, delay: 5.0, options: nil, animations: { () -> Void in
                                self.tipLabel.alpha = 0.0
                                }, completion: { (completed) -> Void in
                                    self.tipLabel.hidden = true
                            })
                    })
            }
        }
    }
 
    func addGestureRecognizers() {
        let tapSport = UITapGestureRecognizer(target: self, action: "sportTapped:")
        self.sportView.addGestureRecognizer(tapSport)
        
        let tapBlogger = UITapGestureRecognizer(target: self, action: "bloggerTapped:")
        self.bloggerView.addGestureRecognizer(tapBlogger)
        
        let tapMusic = UITapGestureRecognizer(target: self, action: "musicTapped:")
        self.musicView.addGestureRecognizer(tapMusic)
        
        let tapCats = UITapGestureRecognizer(target: self, action: "catsTapped:")
        self.catsView.addGestureRecognizer(tapCats)
        
        let pinchSport = UIPinchGestureRecognizer(target: self, action: "sportClose:")
        self.sportView.addGestureRecognizer(pinchSport)
        
        let pinchBlogger = UIPinchGestureRecognizer(target: self, action: "bloggerClose:")
        self.bloggerView.addGestureRecognizer(pinchBlogger)
        
        let pinchMusic = UIPinchGestureRecognizer(target: self, action: "musicClose:")
        self.musicView.addGestureRecognizer(pinchMusic)
        
        let pinchCats = UIPinchGestureRecognizer(target: self, action: "catsClose:")
        self.catsView.addGestureRecognizer(pinchCats)
    }
    
    func sportTapped(tapGesture: UITapGestureRecognizer) {
        self.animateInterest(.Sport)
    }
    
    func bloggerTapped(tapGesture: UITapGestureRecognizer) {
        self.animateInterest(.Blogger)
    }
    
    func musicTapped(tapGesture: UITapGestureRecognizer) {
        self.animateInterest(.Music)
    }
    
    func catsTapped(tapGesture: UITapGestureRecognizer) {
        self.animateInterest(.Cats)
    }
    
    func sportClose(pinchGesture: UIPinchGestureRecognizer) {
        
        self.catsView.hidden = false
        self.bloggerView.hidden = false
        self.musicView.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.sportView.frame = CGRect(x: 225, y: 75, width: 150, height: 150)

            self.sportView.interestImageView.hidden = true
            self.sportView.descriptionLabel.hidden = true
            
            self.catsView.alpha = 1.0
            self.bloggerView.alpha = 1.0
            self.musicView.alpha = 1.0
            
        })
    }
    
    func bloggerClose(pinchGesture: UIPinchGestureRecognizer) {
        
        self.catsView.hidden = false
        self.sportView.hidden = false
        self.musicView.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.bloggerView.frame = CGRect(x: 25, y: 225, width: 150, height: 150)
            
            self.bloggerView.interestImageView.hidden = true
            self.bloggerView.descriptionLabel.hidden = true
            
            self.catsView.alpha = 1.0
            self.sportView.alpha = 1.0
            self.musicView.alpha = 1.0
            
        })
    }
    
    func musicClose(pinchGesture: UIPinchGestureRecognizer) {
        
        self.catsView.hidden = false
        self.bloggerView.hidden = false
        self.sportView.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.musicView.frame = CGRect(x: 425, y: 225, width: 150, height: 150)
            
            self.musicView.interestImageView.hidden = true
            self.musicView.descriptionLabel.hidden = true
            
            self.catsView.alpha = 1.0
            self.bloggerView.alpha = 1.0
            self.sportView.alpha = 1.0
            
        })
    }
    
    func catsClose(pinchGesture: UIPinchGestureRecognizer) {
        
        self.sportView.hidden = false
        self.bloggerView.hidden = false
        self.musicView.hidden = false
                
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.catsView.frame = CGRect(x: 225, y: 375, width: 150, height: 150)
            
            self.catsView.interestImageView.hidden = true
            self.catsView.descriptionLabel.hidden = true
            
            self.sportView.alpha = 1.0
            self.bloggerView.alpha = 1.0
            self.musicView.alpha = 1.0

        })
    }
    
    func animateInterest(type: InterestType) {
        
        self.changeTip()
        
        switch type {
        case .Sport:
            self.sportView.titleLabel.alpha = 0.0
            UIView.animateWithDuration(0.7, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                self.sportView.frame = CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 200, width: 400, height: 400)
                self.sportView.center = CGPoint(x: 300, y: 300)
                
                self.catsView.alpha = 0.0
                self.bloggerView.alpha = 0.0
                self.musicView.alpha = 0.0
      
            }) { (completed) -> Void in
                
                self.addInterestDetails(type)
                
                self.catsView.hidden = true
                self.bloggerView.hidden = true
                self.musicView.hidden = true
                    
            }
        case .Blogger:
            self.bloggerView.titleLabel.alpha = 0.0
            UIView.animateWithDuration(0.7, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                self.bloggerView.frame = CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 200, width: 400, height: 400)
                self.bloggerView.center = CGPoint(x: 300, y: 300)
                
                self.catsView.alpha = 0.0
                self.sportView.alpha = 0.0
                self.musicView.alpha = 0.0
                
                }) { (completed) -> Void in
                    
                self.addInterestDetails(type)
                    
                self.catsView.hidden = true
                self.sportView.hidden = true
                self.musicView.hidden = true
            }
        case .Cats:
            self.catsView.titleLabel.alpha = 0.0
            UIView.animateWithDuration(0.7, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                self.catsView.frame = CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 200, width: 400, height: 400)
                self.catsView.center = CGPoint(x: 300, y: 300)
                
                self.sportView.alpha = 0.0
                self.bloggerView.alpha = 0.0
                self.musicView.alpha = 0.0
                
                }) { (completed) -> Void in
                    
                self.addInterestDetails(type)
                    
                self.sportView.hidden = true
                self.bloggerView.hidden = true
                self.musicView.hidden = true
            }
        case .Music:
            self.musicView.titleLabel.alpha = 0.0
            UIView.animateWithDuration(0.7, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                self.musicView.frame = CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 200, width: 400, height: 400)
                self.musicView.center = CGPoint(x: 300, y: 300)
                
                self.catsView.alpha = 0.0
                self.bloggerView.alpha = 0.0
                self.sportView.alpha = 0.0
                
                }) { (completed) -> Void in
                    
                self.addInterestDetails(type)
                    
                self.catsView.hidden = true
                self.bloggerView.hidden = true
                self.sportView.hidden = true
            }
        }
    }
    
    func addInterestDetails(type: InterestType) {
        switch type {
        case .Sport:
            
            self.sportView.interestImageView.hidden = false
            self.sportView.descriptionLabel.hidden = false

            self.sportView.titleLabel.alpha = 0.0
            self.sportView.interestImageView.alpha = 0.0
            self.sportView.descriptionLabel.alpha = 0.0
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.sportView.titleLabel.frame = CGRect(x: 0, y: 0, width: self.sportView.frame.width, height: 50)
                
                self.sportView.interestImageView.frame = CGRect(x: 0, y: 50, width: self.sportView.frame.width, height: 250)
                self.sportView.interestImageView.image = UIImage(named: "Sport.jpg")
                self.sportView.interestImageView.contentMode = .ScaleAspectFit

                self.sportView.descriptionLabel.frame = CGRect(x: 10, y: 300, width: self.sportView.frame.width - 20, height: 100)
                self.sportView.descriptionLabel.text = "I've been playing unihockey since almost 10 years and I love this sport. It's like hockey but played indoor and you need to run instead of ice skating. I'm both a player and referee."
                
                self.sportView.titleLabel.alpha = 1.0
                self.sportView.interestImageView.alpha = 1.0
                self.sportView.descriptionLabel.alpha = 1.0
            })
            
        case .Blogger:
            
            self.bloggerView.interestImageView.hidden = false
            self.bloggerView.descriptionLabel.hidden = false
            
            self.bloggerView.titleLabel.alpha = 0.0
            self.bloggerView.interestImageView.alpha = 0.0
            self.bloggerView.descriptionLabel.alpha = 0.0
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.bloggerView.titleLabel.frame = CGRect(x: 0, y: 0, width: self.bloggerView.frame.width, height: 50)
                
                self.bloggerView.interestImageView.frame = CGRect(x: 0, y: 50, width: self.bloggerView.frame.width, height: 250)
                self.bloggerView.interestImageView.image = UIImage(named: "Blogger.jpg")
                self.bloggerView.interestImageView.contentMode = .ScaleAspectFit
                
                self.bloggerView.descriptionLabel.frame = CGRect(x: 10, y: 300, width: self.bloggerView.frame.width - 20, height: 100)
                self.bloggerView.descriptionLabel.text = "I like to write tutorials for other developers on my own blog or for other websites. I also really enjoy travelling the world and discover new cool cities!"
                
                self.bloggerView.titleLabel.alpha = 1.0
                self.bloggerView.interestImageView.alpha = 1.0
                self.bloggerView.descriptionLabel.alpha = 1.0
            })
            
        case .Cats:
            
            self.catsView.interestImageView.hidden = false
            self.catsView.descriptionLabel.hidden = false
            
            self.catsView.titleLabel.alpha = 0.0
            self.catsView.interestImageView.alpha = 0.0
            self.catsView.descriptionLabel.alpha = 0.0
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.catsView.titleLabel.frame = CGRect(x: 0, y: 0, width: self.catsView.frame.width, height: 50)
                
                self.catsView.interestImageView.frame = CGRect(x: 0, y: 50, width: self.catsView.frame.width, height: 250)
                self.catsView.interestImageView.image = UIImage(named: "Cats.jpg")
                self.catsView.interestImageView.contentMode = .ScaleAspectFit
                
                self.catsView.descriptionLabel.frame = CGRect(x: 10, y: 300, width: self.catsView.frame.width - 20, height: 100)
                self.catsView.descriptionLabel.text = "I have two black cats named Minou and Lilly and I absolutely love them. I spend a lot of time with them and we have so much fun."
                
                self.catsView.titleLabel.alpha = 1.0
                self.catsView.interestImageView.alpha = 1.0
                self.catsView.descriptionLabel.alpha = 1.0
            })
            
        case .Music:
            
            self.musicView.interestImageView.hidden = false
            self.musicView.descriptionLabel.hidden = false
            
            self.musicView.titleLabel.alpha = 0.0
            self.musicView.interestImageView.alpha = 0.0
            self.musicView.descriptionLabel.alpha = 0.0
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.musicView.titleLabel.frame = CGRect(x: 0, y: 0, width: self.musicView.frame.width, height: 50)
                
                self.musicView.interestImageView.frame = CGRect(x: 0, y: 50, width: self.musicView.frame.width, height: 250)
                self.musicView.interestImageView.image = UIImage(named: "Music.jpg")
                self.musicView.interestImageView.contentMode = .ScaleAspectFit
                
                self.musicView.descriptionLabel.frame = CGRect(x: 10, y: 300, width: self.musicView.frame.width - 20, height: 100)
                self.musicView.descriptionLabel.text = "I constantly listen to music when I'm working or studying. It gives me motivation for my current activity. I listen to Dance and EDM music mostly."
                
                self.musicView.titleLabel.alpha = 1.0
                self.musicView.interestImageView.alpha = 1.0
                self.musicView.descriptionLabel.alpha = 1.0
            })
            
        }
    }
}
