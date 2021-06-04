//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Fenix Lavon on 6/4/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

final class WeatherCell: UITableViewCell {
    static let indentifirer = "WeatherCell"
    
    func configure(with model: WeatherData) {
        textLabel?.text = model.name
    }
}
