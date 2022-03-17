//
//  StartViewController.swift
//  Quiz
//
//  Created by Oleg Rybalko on 16.11.2017.
//  Copyright © 2017 Oleg Rybalko. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var botLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = 15
        topLabel.layer.cornerRadius = 15
        botLabel.layer.cornerRadius = 15
    }

}
