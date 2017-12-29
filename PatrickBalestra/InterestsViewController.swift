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
        case sport
        case blogger
        case music
        case cats
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
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont(name: "HelveticaNeue-Light", size: 20)!]
        
        self.sportView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.musicView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.catsView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        self.bloggerView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
        self.addGestureRecognizers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
            self.sportView.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.2, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
            self.musicView.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.4, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
            self.catsView.transform = CGAffineTransform.identity
            }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.6, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
            self.bloggerView.transform = CGAffineTransform.identity
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 4.0, options: [], animations: { () -> Void in
            self.tipLabel.alpha = 0.0
            }, completion: nil)
        
    }

    // MARK: IBActions
    
    @IBAction func dismiss(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Methods
    
    func changeTip() {
        if (self.tipLabel) != nil {
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.tipLabel.alpha = 0.0
                }) { (completed) -> Void in
                    self.tipLabel.text = "Pinch to close a bubble."
                    UIView.animate(withDuration: 0.5, animations: { () -> Void in
                        self.tipLabel.alpha = 1.0
                        }, completion: { (completed) -> Void in
                            UIView.animate(withDuration: 0.5, delay: 5.0, options: [], animations: { () -> Void in
                                self.tipLabel.alpha = 0.0
                                }, completion: { (completed) -> Void in
                                    self.tipLabel.isHidden = true
                            })
                    })
            }
        }
    }
 
    func addGestureRecognizers() {
        let tapSport = UITapGestureRecognizer(target: self, action: #selector(sportTapped(_:)))
        self.sportView.addGestureRecognizer(tapSport)
        
        let tapBlogger = UITapGestureRecognizer(target: self, action: #selector(bloggerTapped(_:)))
        self.bloggerView.addGestureRecognizer(tapBlogger)
        
        let tapMusic = UITapGestureRecognizer(target: self, action: #selector(musicTapped(_:)))
        self.musicView.addGestureRecognizer(tapMusic)
        
        let tapCats = UITapGestureRecognizer(target: self, action: #selector(catsTapped(_:)))
        self.catsView.addGestureRecognizer(tapCats)
        
        let pinchSport = UIPinchGestureRecognizer(target: self, action: #selector(sportClose(_:)))
        self.sportView.addGestureRecognizer(pinchSport)
        
        let pinchBlogger = UIPinchGestureRecognizer(target: self, action: #selector(bloggerClose(_:)))
        self.bloggerView.addGestureRecognizer(pinchBlogger)
        
        let pinchMusic = UIPinchGestureRecognizer(target: self, action: #selector(musicClose(_:)))
        self.musicView.addGestureRecognizer(pinchMusic)
        
        let pinchCats = UIPinchGestureRecognizer(target: self, action: #selector(catsClose(_:)))
        self.catsView.addGestureRecognizer(pinchCats)
    }
    
    @objc func sportTapped(_ tapGesture: UITapGestureRecognizer) {
        self.animateInterest(.sport)
    }
    
    @objc func bloggerTapped(_ tapGesture: UITapGestureRecognizer) {
        self.animateInterest(.blogger)
    }
    
    @objc func musicTapped(_ tapGesture: UITapGestureRecognizer) {
        self.animateInterest(.music)
    }
    
    @objc func catsTapped(_ tapGesture: UITapGestureRecognizer) {
        self.animateInterest(.cats)
    }
    
    @objc func sportClose(_ pinchGesture: UIPinchGestureRecognizer) {
        
        self.catsView.isHidden = false
        self.bloggerView.isHidden = false
        self.musicView.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.sportView.frame = CGRect(x: 225, y: 75, width: 150, height: 150)

            self.sportView.interestImageView.isHidden = true
            self.sportView.descriptionLabel.isHidden = true
            
            self.catsView.alpha = 1.0
            self.bloggerView.alpha = 1.0
            self.musicView.alpha = 1.0
            
        })
    }
    
    @objc func bloggerClose(_ pinchGesture: UIPinchGestureRecognizer) {
        
        self.catsView.isHidden = false
        self.sportView.isHidden = false
        self.musicView.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.bloggerView.frame = CGRect(x: 25, y: 225, width: 150, height: 150)
            
            self.bloggerView.interestImageView.isHidden = true
            self.bloggerView.descriptionLabel.isHidden = true
            
            self.catsView.alpha = 1.0
            self.sportView.alpha = 1.0
            self.musicView.alpha = 1.0
            
        })
    }
    
    @objc func musicClose(_ pinchGesture: UIPinchGestureRecognizer) {
        
        self.catsView.isHidden = false
        self.bloggerView.isHidden = false
        self.sportView.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.musicView.frame = CGRect(x: 425, y: 225, width: 150, height: 150)
            
            self.musicView.interestImageView.isHidden = true
            self.musicView.descriptionLabel.isHidden = true
            
            self.catsView.alpha = 1.0
            self.bloggerView.alpha = 1.0
            self.sportView.alpha = 1.0
            
        })
    }
    
    @objc func catsClose(_ pinchGesture: UIPinchGestureRecognizer) {
        
        self.sportView.isHidden = false
        self.bloggerView.isHidden = false
        self.musicView.isHidden = false
                
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.catsView.frame = CGRect(x: 225, y: 375, width: 150, height: 150)
            
            self.catsView.interestImageView.isHidden = true
            self.catsView.descriptionLabel.isHidden = true
            
            self.sportView.alpha = 1.0
            self.bloggerView.alpha = 1.0
            self.musicView.alpha = 1.0

        })
    }
    
    func animateInterest(_ type: InterestType) {
        
        self.changeTip()
        
        switch type {
        case .sport:
            self.sportView.titleLabel.alpha = 0.0
            UIView.animate(withDuration: 0.7, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
                self.sportView.frame = CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 200, width: 400, height: 400)
                self.sportView.center = CGPoint(x: 300, y: 300)
                
                self.catsView.alpha = 0.0
                self.bloggerView.alpha = 0.0
                self.musicView.alpha = 0.0
      
            }) { (completed) -> Void in
                
                self.addInterestDetails(type)
                
                self.catsView.isHidden = true
                self.bloggerView.isHidden = true
                self.musicView.isHidden = true
                    
            }
        case .blogger:
            self.bloggerView.titleLabel.alpha = 0.0
            UIView.animate(withDuration: 0.7, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
                self.bloggerView.frame = CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 200, width: 400, height: 400)
                self.bloggerView.center = CGPoint(x: 300, y: 300)
                
                self.catsView.alpha = 0.0
                self.sportView.alpha = 0.0
                self.musicView.alpha = 0.0
                
                }) { (completed) -> Void in
                    
                self.addInterestDetails(type)
                    
                self.catsView.isHidden = true
                self.sportView.isHidden = true
                self.musicView.isHidden = true
            }
        case .cats:
            self.catsView.titleLabel.alpha = 0.0
            UIView.animate(withDuration: 0.7, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
                self.catsView.frame = CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 200, width: 400, height: 400)
                self.catsView.center = CGPoint(x: 300, y: 300)
                
                self.sportView.alpha = 0.0
                self.bloggerView.alpha = 0.0
                self.musicView.alpha = 0.0
                
                }) { (completed) -> Void in
                    
                self.addInterestDetails(type)
                    
                self.sportView.isHidden = true
                self.bloggerView.isHidden = true
                self.musicView.isHidden = true
            }
        case .music:
            self.musicView.titleLabel.alpha = 0.0
            UIView.animate(withDuration: 0.7, delay: 0.0,usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: { () -> Void in
                self.musicView.frame = CGRect(x: self.view.bounds.width / 2 - 200, y: self.view.bounds.height / 2 - 200, width: 400, height: 400)
                self.musicView.center = CGPoint(x: 300, y: 300)
                
                self.catsView.alpha = 0.0
                self.bloggerView.alpha = 0.0
                self.sportView.alpha = 0.0
                
                }) { (completed) -> Void in
                    
                self.addInterestDetails(type)
                    
                self.catsView.isHidden = true
                self.bloggerView.isHidden = true
                self.sportView.isHidden = true
            }
        }
    }
    
    func addInterestDetails(_ type: InterestType) {
        switch type {
        case .sport:
            
            self.sportView.interestImageView.isHidden = false
            self.sportView.descriptionLabel.isHidden = false

            self.sportView.titleLabel.alpha = 0.0
            self.sportView.interestImageView.alpha = 0.0
            self.sportView.descriptionLabel.alpha = 0.0
            
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                
                self.sportView.titleLabel.frame = CGRect(x: 0, y: 0, width: self.sportView.frame.width, height: 50)
                
                self.sportView.interestImageView.frame = CGRect(x: 0, y: 50, width: self.sportView.frame.width, height: 250)
                self.sportView.interestImageView.image = UIImage(named: "Sport.jpg")
                self.sportView.interestImageView.contentMode = .scaleAspectFit

                self.sportView.descriptionLabel.frame = CGRect(x: 10, y: 300, width: self.sportView.frame.width - 20, height: 100)
                self.sportView.descriptionLabel.text = "I've been playing unihockey since almost 10 years and I love this sport. It's like hockey but played indoor and you need to run instead of ice skating. I'm both a player and referee."
                
                self.sportView.titleLabel.alpha = 1.0
                self.sportView.interestImageView.alpha = 1.0
                self.sportView.descriptionLabel.alpha = 1.0
            })
            
        case .blogger:
            
            self.bloggerView.interestImageView.isHidden = false
            self.bloggerView.descriptionLabel.isHidden = false
            
            self.bloggerView.titleLabel.alpha = 0.0
            self.bloggerView.interestImageView.alpha = 0.0
            self.bloggerView.descriptionLabel.alpha = 0.0
            
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                
                self.bloggerView.titleLabel.frame = CGRect(x: 0, y: 0, width: self.bloggerView.frame.width, height: 50)
                
                self.bloggerView.interestImageView.frame = CGRect(x: 0, y: 50, width: self.bloggerView.frame.width, height: 250)
                self.bloggerView.interestImageView.image = UIImage(named: "Blogger.jpg")
                self.bloggerView.interestImageView.contentMode = .scaleAspectFit
                
                self.bloggerView.descriptionLabel.frame = CGRect(x: 10, y: 300, width: self.bloggerView.frame.width - 20, height: 100)
                self.bloggerView.descriptionLabel.text = "I like to write tutorials for other developers on my own blog or for other websites. I also really enjoy travelling the world and discover new cool cities!"
                
                self.bloggerView.titleLabel.alpha = 1.0
                self.bloggerView.interestImageView.alpha = 1.0
                self.bloggerView.descriptionLabel.alpha = 1.0
            })
            
        case .cats:
            
            self.catsView.interestImageView.isHidden = false
            self.catsView.descriptionLabel.isHidden = false
            
            self.catsView.titleLabel.alpha = 0.0
            self.catsView.interestImageView.alpha = 0.0
            self.catsView.descriptionLabel.alpha = 0.0
            
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                
                self.catsView.titleLabel.frame = CGRect(x: 0, y: 0, width: self.catsView.frame.width, height: 50)
                
                self.catsView.interestImageView.frame = CGRect(x: 0, y: 50, width: self.catsView.frame.width, height: 250)
                self.catsView.interestImageView.image = UIImage(named: "Cats.jpg")
                self.catsView.interestImageView.contentMode = .scaleAspectFit
                
                self.catsView.descriptionLabel.frame = CGRect(x: 10, y: 300, width: self.catsView.frame.width - 20, height: 100)
                self.catsView.descriptionLabel.text = "I have two black cats named Minou and Lilly and I absolutely love them. I spend a lot of time with them and we have so much fun."
                
                self.catsView.titleLabel.alpha = 1.0
                self.catsView.interestImageView.alpha = 1.0
                self.catsView.descriptionLabel.alpha = 1.0
            })
            
        case .music:
            
            self.musicView.interestImageView.isHidden = false
            self.musicView.descriptionLabel.isHidden = false
            
            self.musicView.titleLabel.alpha = 0.0
            self.musicView.interestImageView.alpha = 0.0
            self.musicView.descriptionLabel.alpha = 0.0
            
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                
                self.musicView.titleLabel.frame = CGRect(x: 0, y: 0, width: self.musicView.frame.width, height: 50)
                
                self.musicView.interestImageView.frame = CGRect(x: 0, y: 50, width: self.musicView.frame.width, height: 250)
                self.musicView.interestImageView.image = UIImage(named: "Music.jpg")
                self.musicView.interestImageView.contentMode = .scaleAspectFit
                
                self.musicView.descriptionLabel.frame = CGRect(x: 10, y: 300, width: self.musicView.frame.width - 20, height: 100)
                self.musicView.descriptionLabel.text = "I constantly listen to music when I'm working or studying. It gives me motivation for my current activity. I listen to Dance and EDM music mostly."
                
                self.musicView.titleLabel.alpha = 1.0
                self.musicView.interestImageView.alpha = 1.0
                self.musicView.descriptionLabel.alpha = 1.0
            })
            
        }
    }
}
