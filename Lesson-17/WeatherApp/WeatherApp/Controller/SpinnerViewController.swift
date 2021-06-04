//
//  SpinnerViewController.swift
//  WeatherApp
//
//  Created by Fenix Lavon on 6/4/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class SpinnerViewController: UIViewController {
    private let spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
