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
    private var placeLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    private var completeButton: UIButton = {
       var button = UIButton()
        button.backgroundColor = .orange
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(placeLabel)
        contentView.addSubview(completeButton)
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            completeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 2),
            completeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
//            completeButton.leadingAnchor.constraint(equalTo: placeLabel.trailingAnchor, constant: -2),
            placeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            placeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 2),
            completeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            completeButton.widthAnchor.constraint(equalToConstant: 10)
        ])
        
    }
    
    func configure(place: String) {
        placeLabel.text = place
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
