//
//  ProjectsCollectionViewController.swift
//  PatrickBalestra
//
//  Created by Patrick Balestra on 19/04/15.
//  Copyright (c) 2015 Patrick Balestra. All rights reserved.
//

import UIKit

class ProjectsCollectionViewController: UICollectionViewController {

    let projectsDataSource = ProjectsDataSource()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.202, green:0.808, blue:0.459, alpha:1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont(name: "HelveticaNeue-Light", size: 20)!]
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 350, height: 270)
        collectionViewLayout.minimumInteritemSpacing = 0
        self.collectionView?.collectionViewLayout = collectionViewLayout
    }
    
    // MARK: IBActions
    
    @IBAction func dismiss(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "ProjectDetails":
                let nextController = segue.destination as? ProjectDetailsViewController
                if let selectedIndex = self.collectionView?.indexPathsForSelectedItems?.first?.row {
                    nextController?.project = self.projectsDataSource.projects[selectedIndex]
                }
            default:
                print()
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.projectsDataSource.projects.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.projectCollectionViewCellReuseIdentifier, for: indexPath) as! ProjectCollectionViewCell
    
        cell.project = self.projectsDataSource.projects[indexPath.row]
        
        return cell
    }

}
