//
//  ViewController.swift
//  CAHomework
//
//  Created by Fenix Lavon on 5/28/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy private var turnOnButton: UIButton = {
        var button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 20)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy private var kindergartenView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "kindergarten"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var schoolView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "school"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var universityView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "university"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var houseView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "house"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var babyView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Baby"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var littleGirlView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "LittleGirl"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy private var girlView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Girl"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var womanGirl: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Woman"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy private var grandMotherView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "grandPa"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(kindergartenView)
        view.addSubview(schoolView)
        view.addSubview(universityView)
        view.addSubview(houseView)
        view.addSubview(babyView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NSLayoutConstraint.activate([
            babyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            babyView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            babyView.widthAnchor.constraint(equalTo: kindergartenView.widthAnchor, multiplier: 0.7),
            babyView.heightAnchor.constraint(equalTo: kindergartenView.heightAnchor, multiplier: 0.7),
            
            kindergartenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            kindergartenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            kindergartenView.widthAnchor.constraint(equalToConstant: kindergartenView.frame.width),
            kindergartenView.heightAnchor.constraint(equalToConstant: kindergartenView.frame.height),
            
            schoolView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            schoolView.bottomAnchor.constraint(equalTo: kindergartenView.topAnchor, constant: -45),
            schoolView.widthAnchor.constraint(equalToConstant: schoolView.frame.width),
            schoolView.heightAnchor.constraint(equalToConstant: schoolView.frame.height),
            
            universityView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            universityView.centerYAnchor.constraint(equalTo: schoolView.centerYAnchor),
            universityView.widthAnchor.constraint(equalToConstant: universityView.frame.width),
            universityView.heightAnchor.constraint(equalToConstant: universityView.frame.height),
            
            houseView.bottomAnchor.constraint(equalTo: universityView.topAnchor, constant: -45),
            houseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            houseView.widthAnchor.constraint(equalToConstant: houseView.frame.width),
            houseView.heightAnchor.constraint(equalToConstant: houseView.frame.height),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc private func buttonTapped() {
        
    }
}

