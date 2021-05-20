//
//  ViewController.swift
//  UIKitLesson
//
//  Created by Артур Лутфуллин on 20.05.2021.
//

import UIKit

class ViewController: UIViewController {
	lazy var laughLabel: UILabel = {
		var label = UILabel()
		label.text = "Welcome"
		return label
	}()
	
	lazy var donutView: UIView = {
		var view = DonutView()
		view.backgroundColor = .orange
		return view
	}()
	
	
	lazy var pushButton: UIButton = {
		var button = UIButton()
		button.setTitle("View Controller 2", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.titleLabel?.font = UIFont(name: "SF Pro", size: 10)
		button.titleLabel?.lineBreakMode = .byWordWrapping
		button.backgroundColor = .white
		button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
		return button
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(pushButton)
		view.addSubview(donutView)
		view.backgroundColor = .white
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		donutView.frame = CGRect(x: view.center.x - 100,
								   y: view.center.y - 100,
								   width: 200,
								   height: 200)
		pushButton.frame = CGRect(x: view.center.x - 50,
								  y: view.center.y - 50,
								  width: 100,
								  height: 100)
	}
	
	@objc private func pushButtonTapped() {
		let secondVC = SecondViewController()
		let navVC = UINavigationController(rootViewController: secondVC)
		present(navVC, animated: true)
	}
}

