//
//  GameCell.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 29.05.2021.
//

import UIKit

final class GameCell: UITableViewCell {

    static let indentifirer = "GameCell"

    func configure(with title: String) {
        textLabel?.text = title
    }
}
