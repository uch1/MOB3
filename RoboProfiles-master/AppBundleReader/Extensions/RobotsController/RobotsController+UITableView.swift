//
//  RobotsController+UITableView.swift
//  AppBundleReader
//
//  Created by Uchenna  Aguocha on 1/13/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

extension RobotsController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RobotCell
        
        let robot = robots[indexPath.row]
        // cell.robot is a property observer that expects any changes or update
        cell.robot = robot
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let robot = robots[indexPath.row]
        
        let robotsProfileController = RobotsProfileController()
        robotsProfileController.robot = robot
        
        navigationController?.pushViewController(robotsProfileController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return robots.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
