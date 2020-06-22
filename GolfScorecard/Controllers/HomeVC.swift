//
//  ViewController.swift
//  GolfScorecard
//
//  Created by Nicholas Kearns on 6/22/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    
    
    let titlesOfCells: [String] = [
        "New Round",
        "Past Rounds",
        "Resume Round"
    ]
    
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Golf Scorecard"
        setupCollectionView()
    }

    
    
    
    func setupCollectionView() {
        
        //pin the collection view to the bounds of the view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .systemGray6
        
        collectionView.register(UINib(nibName: "MainCategoryCell", bundle: .main), forCellWithReuseIdentifier: MainCategoryCell.identifier)
        
        
        
        view.addSubview(collectionView)
        collectionView.reloadData()
        
        
    }
    

}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlesOfCells.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pastRoundsVC = PastRoundsVC()
        navigationController?.pushViewController(pastRoundsVC, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCategoryCell.identifier, for: indexPath) as! MainCategoryCell
        
        
        //This creates the shadows and modifies the cards a little bit
        //Got this from a Riley Norris youtube video
        //https://github.com/rileydnorris/cardLayoutSwift
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        
        
        cell.setupLabel(textLabel: titlesOfCells[indexPath.row])
        return cell
    }
    
    

    
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.75, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 25, bottom: 0, right: 25) //.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}


