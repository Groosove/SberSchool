//
//  SpinnerViewController.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 29.05.2021.
//

import UIKit

class SpinnerViewController: UIViewController {
    private let spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
//        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
