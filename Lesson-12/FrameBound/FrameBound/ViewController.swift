//
//  ViewController.swift
//  FrameBound
//
//  Created by Fenix Lavon on 19/05/2021.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var someView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(someView)
        someView.translatesAutoresizingMaskIntoConstraints = false
        someView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        someView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        someView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        someView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        someView.backgroundColor = .orange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
       
}

