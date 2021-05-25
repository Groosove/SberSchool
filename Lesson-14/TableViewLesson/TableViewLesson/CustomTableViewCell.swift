//
//  CustomTableViewCell.swift
//  TableViewLesson
//
//  Created by Fenix Lavon on 5/24/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomIdentifier"
	var isComplete = false
	
	lazy var placeLabel: UILabel = {
        var label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
	lazy var completeButton: UIButton = {
		var button = UIButton(type: .system)
		button.setTitle("❎", for: .normal)
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
	
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.backgroundColor = .gray
        contentView.addSubview(placeLabel)
        contentView.addSubview(completeButton)
    }
    
	override class var requiresConstraintBasedLayout: Bool {
		  return true
	  }
	
	override func updateConstraints() {
		NSLayoutConstraint.activate([
			completeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
			completeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
			completeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			placeLabel.topAnchor.constraint(equalTo: topAnchor),
			placeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
			placeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			placeLabel.trailingAnchor.constraint(equalTo: completeButton.leadingAnchor),
		])
		super.updateConstraints()
	}
	
	func configure(place: String) {
        placeLabel.text = place
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	@objc private func buttonTapped() {
		isComplete = !isComplete
		let buttonTitle = isComplete ? "✅" : "❎"
		contentView.backgroundColor = isComplete ? .green : .gray
		completeButton.setTitle(buttonTitle, for: .normal)
	}
}
