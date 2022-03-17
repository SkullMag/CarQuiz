//
//  ViewController.swift
//  Quiz
//
//  Created by Oleg Rybalko on 15.11.2017.
//  Copyright © 2017 Oleg Rybalko. All rights reserved.
//

import UIKit

struct Question
{
    var questionImg: UIImage!
    var answers: [String]!
    var answer: Int!
}
var score = 0
var correct = 0
var place = 0

class ViewController: UIViewController {

    @IBOutlet var button: [UIButton]!
    @IBOutlet var qImage: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    
    var questions = [Question]()
    var qNumber = Int()
    var answerNumber = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        scoreLabel.text = "Correct: \(correct)/30"
        
        allQuestions()
        pickQuestion()
        
    }
    
    func allQuestions()
    {
        questions = [
            Question(questionImg: UIImage(named: "mclaren-logo.png"), answers: ["Koenigsegg","Porsche","Renault","McLaren"], answer: 3),
            Question(questionImg: UIImage(named: "Mercedes-logo.png"), answers: ["Mercedes","Ferrari","Renault","Hyundai"], answer: 0),
            Question(questionImg: UIImage(named: "Koenigsegg-logo.png"), answers: ["Koenigsegg","Mazda","Gumpert","Maserati"], answer: 0),
            Question(questionImg: UIImage(named: "Dodge-logo.png"), answers: ["Dodge","Cadillac","Peugeot","Shelby"], answer: 0),
            Question(questionImg: UIImage(named: "Maserati-logo.png"), answers: ["Tesla","Venturi","Acura","Maserati"], answer: 3),
            Question(questionImg: UIImage(named: "Cadillac-logo.png"), answers: ["Chrysler","Lotus","Cadillac","Lincoln"], answer: 2),
            Question(questionImg: UIImage(named: "Maybach-logo.png"), answers: ["Maybach","Alpina","Microcar","Marcos"], answer: 0),
            Question(questionImg: UIImage(named: "Mazda-logo.png"), answers: ["Citroen","Mazda","Opel","Toyota"], answer: 1),
            Question(questionImg: UIImage(named: "Buick-logo.png"), answers: ["Buick","Franklin","Fiat","Lincoln"], answer: 0),
            Question(questionImg: UIImage(named: "Chevrolet-logo.png"), answers: ["Spyker","Talbot","Volvo","Chevrolet"], answer: 3),
            Question(questionImg: UIImage(named: "Shelby-logo.png"), answers: ["GT-R","Viper","Pagani","Shelby"], answer: 3),
            Question(questionImg: UIImage(named: "Honda-logo.png"), answers: ["Suzuki","Honda","Hudson","Hyuindai"], answer: 1),
            Question(questionImg: UIImage(named: "W-Motors-logo.png"), answers: ["W Motors","Westfield","Wiesmann","Ruf"], answer: 0),
            Question(questionImg: UIImage(named: "Subaru-logo.png"), answers: ["Morgan","SEAT","Subaru","Saleen"], answer: 2),
            Question(questionImg: UIImage(named: "Skoda-logo.png"), answers: ["KIA","Saab","Daewoo","Škoda"], answer: 3),
            Question(questionImg: UIImage(named: "Corvette-logo.png"), answers: ["Corvette","Alpina","Dodge","Brammo"], answer: 0),
            Question(questionImg: UIImage(named: "Volkswagen-logo.png"), answers: ["Volvo","Volkswagen","Tata","MAN"], answer: 1),
            Question(questionImg: UIImage(named: "Geely-logo.png"), answers: ["Bugatti","Jeep","Geely","BYD"], answer: 2),
            Question(questionImg: UIImage(named: "Jaguar-logo.png"), answers: ["Brilliance","Jaguar","Lancia","Luxgen"], answer: 1),
            Question(questionImg: UIImage(named: "Viper-logo.png"), answers: ["Viper","PGO","RUF","Morris"], answer: 0),
            Question(questionImg: UIImage(named: "Mini-logo.png"), answers: ["Genesis","Lotus","Jeep","Mini"], answer: 3),
            Question(questionImg: UIImage(named: "GAZ-logo.png"), answers: ["Hummer","Ariel","Lada","Gaz"], answer: 3),
            Question(questionImg: UIImage(named: "Peugeot-logo.png"), answers: ["Peugeot","Franklin","Citroen","Infiniti"], answer: 0),
            Question(questionImg: UIImage(named: "Brabus-logo.png"), answers: ["Brammo","Brabus","Baojun","Bristol"], answer: 1),
            Question(questionImg: UIImage(named: "Mustang-logo.png"), answers: ["Rezvani","Ferrari","Porsche","Mustang"], answer: 3),
            Question(questionImg: UIImage(named: "Genesis-logo.png"), answers: ["Elfin","Genesis","Mosler","Jawa"], answer: 1),
            Question(questionImg: UIImage(named: "Ferrari-logo.png"), answers: ["Jaguar","Lamborghini","Ferrari","Maserati"], answer: 2),
            Question(questionImg: UIImage(named: "Lotus-logo.png"), answers: ["Jensen","Lotus","AC Cars","Bristol"], answer: 1),
            Question(questionImg: UIImage(named: "Pontiac-logo.png"), answers: ["SRT","Pontiac","Saturn","Triumph"], answer: 1),
            Question(questionImg: UIImage(named: "Lincoln-logo.png"), answers: ["Lincoln","Foton","Scion","TechArt"], answer: 0),
        ]
    }
    
    func setup()
    {
        button[0].layer.cornerRadius = 15
        button[1].layer.cornerRadius = 15
        button[2].layer.cornerRadius = 15
        button[3].layer.cornerRadius = 15
        scoreLabel.layer.cornerRadius = 15
        qImage.contentMode = .scaleAspectFit
    }
    
    func pickQuestion()
    {
        if questions.count > 0
        {
            qNumber = 0
            qImage.image = questions[qNumber].questionImg
            answerNumber = questions[qNumber].answer
            
            for i in 0..<button.count
            {
                button[i].setTitle(questions[qNumber].answers[i], for: .normal)
            }
            
            questions.remove(at: qNumber)
            
        } else {
            //questions.remove(at: qNumber)
        }
    }
    
    @IBAction func button1(_ sender: UIButton)
    {
        place += 1
        if answerNumber == 0
        {
            score += 100
            correct += 1
            scoreLabel.text = "Correct: \(correct)/30"
            pickQuestion()
            if place >= 30
            {
                performSegue(withIdentifier: "segue", sender: self)
            }
        }
        else
        {
            if score != 0
            {
            score = score - 100
            scoreLabel.text = "Correct: \(correct)/30"
            pickQuestion()
            } else {
                scoreLabel.text = "Correct: \(correct)/30"
                pickQuestion()
            }
            if place >= 30
            {
                performSegue(withIdentifier: "segue", sender: self)
            }
        }
    }
    @IBAction func button2(_ sender: UIButton)
    {
        place += 1
        if answerNumber == 1
        {
            score += 100
            correct += 1
            scoreLabel.text = "Correct: \(correct)/30"
            pickQuestion()
            if place >= 30
            {
                performSegue(withIdentifier: "segue", sender: self)
            }
        }
        else
        {
            if score != 0
            {
                score = score - 100
                scoreLabel.text = "Correct: \(correct)/30"
                pickQuestion()
            } else {
                scoreLabel.text = "Correct: \(correct)/30"
                pickQuestion()
            }
            if place >= 30
            {
                performSegue(withIdentifier: "segue", sender: self)
            }
        }
    }
    @IBAction func button3(_ sender: UIButton)
    {
        place += 1
        if answerNumber == 2
        {
            correct += 1
            score += 100
            scoreLabel.text = "Correct: \(correct)/30"
            pickQuestion()
            if place >= 30
            {
                performSegue(withIdentifier: "segue", sender: self)
            }
        }
        else
        {
            if score != 0
            {
                score = score - 100
                scoreLabel.text = "Correct: \(correct)/30"
                pickQuestion()
            } else {
                scoreLabel.text = "Correct: \(correct)/30"
                pickQuestion()
            }
            if place >= 30
            {
                performSegue(withIdentifier: "segue", sender: self)
            }
        }
    }
    @IBAction func button4(_ sender: UIButton)
    {
        place += 1
        if answerNumber == 3
        {
            correct += 1
            score += 100
            scoreLabel.text = "Correct: \(correct)/30"
            pickQuestion()
            if place >= 30
            {
                performSegue(withIdentifier: "segue", sender: self)
            }
        }
        else
        {
            if score != 0
            {
                score = score - 100
                scoreLabel.text = "Correct: \(correct)/30"
                pickQuestion()
            } else {
                scoreLabel.text = "Correct: \(correct)/30"
                pickQuestion()
            }
            if place >= 30
            {
                performSegue(withIdentifier: "segue", sender: self)
            }
        }
    }

}

