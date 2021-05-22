//
//  ExampleActivity.swift
//  ActivityViewController
//
//  Created by Fenix Lavon on 5/22/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import UIKit

class ExampleActivity: UIActivity {
    override var activityTitle: String? { return "MyExampleActivity" }
    override var activityImage: UIImage? { return UIImage(named: "chat") }
    override class var activityCategory: UIActivity.Category { return .share }
    override var activityType: UIActivity.ActivityType? { return .none }
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool { return true }
}
