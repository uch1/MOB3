//
//  ViewController.swift
//  AppBundleReader
//
//  Created by Eliel A. Gordon on 10/26/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class RobotsController: UITableViewController {

    let cellID = "cellID"
    var robots = [Robot]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.darkGrayBlue
        tableView.tableFooterView = UIView()
        tableView.register(RobotCell.self, forCellReuseIdentifier: cellID)
        
        navigationItem.title = "Robots"
        
        fetchRobots()
    }
    
    private func fetchRobots() {
        
        if let path = Bundle.main.path(forResource: "robo-profiles", ofType: ".json") {
            
            let urlPath = URL(fileURLWithPath: path)
            
            guard let data = try? Data(contentsOf: urlPath, options: .alwaysMapped) else { return }
            //print(data)
            
            guard let decodedRobot = try? JSONDecoder().decode([Robot].self, from: data) else { return }
            
            self.robots = decodedRobot
            //print(robots)
        }
        
    }

}

