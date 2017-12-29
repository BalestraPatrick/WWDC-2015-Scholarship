//
//  AchievementsViewController.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 01/02/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var achievementsDataSource = AchievementsDataSource()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.95, green:0.309, blue:0.203, alpha:1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont(name: "HelveticaNeue-Light", size: 20)!]
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 580
        
    }
    
    // MARK: IBActions

    @IBAction func dismiss(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievementsDataSource.achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementCell") as! AchievementTableViewCell
        
        cell.achievement = achievementsDataSource.achievements[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! AchievementTableViewCell
        cell.achievement = nil
    }
    
}
