//
//  ViewController.swift
//  ActivityViewController
//
//  Created by Fenix Lavon on 5/22/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var shareButton: UIButton = {
        var button = UIButton(frame: CGRect(x: view.center.x - 25, y: view.center.y - 22, width: 50, height: 44))
        button.setTitle("Share", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(shareButton)
    }
    
    @objc private func shareTapped() {
        let exampleActivity = ExampleActivity()
        
        let view = UIImage(named: "sun")!
        let shareController = UIActivityViewController(activityItems: [view], applicationActivities: [exampleActivity])
        shareController.excludedActivityTypes = [.saveToCameraRoll, .postToVimeo, .postToFlickr]
        present(shareController, animated: true, completion: nil)
    }
}

