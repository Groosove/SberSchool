//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Fenix Lavon on 6/4/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    private let spinner = SpinnerViewController()

    var isLoading = false {
        didSet {
            guard oldValue != isLoading else { return }
            showSpinner(isShown: isLoading)
        }
    }

    private func showSpinner(isShown: Bool) {
        if isShown {
            addChild(spinner)
            spinner.view.frame = view.frame
            view.addSubview(spinner.view)
            spinner.didMove(toParent: self)
        } else {
            spinner.willMove(toParent: nil)
            spinner.view.removeFromSuperview()
            spinner.removeFromParent()
        }
    }
}
