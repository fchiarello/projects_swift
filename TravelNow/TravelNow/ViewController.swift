//
//  ViewController.swift
//  TravelNow
//
//  Created by Danilo Requena on 20/01/19.
//  Copyright © 2019 Danilo Requena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var travelTable: UITableView!
    @IBOutlet weak var viewHotels: UIView!
    @IBOutlet weak var viewPackages: UIView!
    
    let travelList: Array<Travel> = TravelDAO().returnAllTravels()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.travelTable.dataSource = self
        self.viewHotels.layer.cornerRadius = 10
        self.viewPackages.layer.cornerRadius = 10
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentTravel = travelList[indexPath.row]
        cell.textLabel?.text = currentTravel.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }


}

