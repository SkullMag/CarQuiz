//
//  FinishViewController.swift
//  Quiz
//
//  Created by Oleg Rybalko on 16.11.2017.
//  Copyright © 2017 Oleg Rybalko. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    @IBOutlet var finishScoreLabel: UILabel!
    @IBOutlet var finishStatLabel: UILabel!
    @IBOutlet var restartBtn: UIButton!
    @IBOutlet var shareBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finishScoreLabel.text = "Score: \(score)/3000"
        finishStatLabel.text = "Correct: \(correct)/30"
        restartBtn.layer.cornerRadius = 15
        shareBtn.layer.cornerRadius = 15
    }
    
    @IBAction func restartButton(_ sender: UIButton)
    {
        correct = 0
        score = 0
        place = 0
    }

    @IBAction func shareButton(_ sender: UIButton)
    {
        let activityVC = UIActivityViewController(activityItems: ["My result in Car Quiz - CQ is: Score: \(score)/3000, Correct: \(correct)/30. Download this app and try to beat my record: https://itunes.apple.com/us/app/car-quiz-cq/id1252564438?l=ru&ls=1&mt=8"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
