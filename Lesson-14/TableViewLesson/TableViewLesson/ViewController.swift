//
//  ViewController.swift
//  TableViewLesson
//
//  Created by Fenix Lavon on 5/24/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    private var placeLocation = ["New York", "Moscow", "Kazan", "Peter"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeLocation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
		cell.configure(place: placeLocation[indexPath.row])
        return cell
    }
    
	// MARK: - UITableViewDelegate
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let secondVC = SecondViewController()
		secondVC.title = placeLocation[indexPath.row]
		navigationController?.pushViewController(secondVC, animated: true)
	}
}
