//
//  PastRoundsVC.swift
//  GolfScorecard
//
//  Created by Nicholas Kearns on 6/22/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit


class PastRoundsVC: UIViewController {
    
    
    
    
    var pastRoundsList: [GolfRound] = []
    
    var pastRoundsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        
        
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let round1 = GolfRound(score: 90, coursePar: 72, courseName: "Braintree Muni")
        pastRoundsList.append(round1)
        
        setupTableView()
    }
    
    
    
    
    
    func setupTableView() {
           
           self.view.addSubview(pastRoundsTableView)
           
           pastRoundsTableView.dataSource = self
           pastRoundsTableView.delegate = self
           
           
           pastRoundsTableView.backgroundColor = .systemGray6
           
           pastRoundsTableView.frame = view.bounds
           
           
           pastRoundsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

           
           pastRoundsTableView.reloadData()
           
           
           
       }
    
}


extension PastRoundsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastRoundsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pastRoundsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentRound = pastRoundsList[indexPath.row]
        cell.textLabel?.text = "\(currentRound.courseName) \(currentRound.score)"
        
        return cell
    }
    
    
    
    
}

