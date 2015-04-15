//
//  RoshamboViewController.swift
//  Roshambo
//
//  Created by Umar Qattan on 4/14/15.
//  Copyright (c) 2015 Umar Qattan. All rights reserved.
//

import UIKit


class RoshamboViewController: UIViewController
{
    
    @IBOutlet weak var resultLabel:           UILabel!
    @IBOutlet weak var roshamboImageView: UIImageView!
   
    
    var playerMove:  String!
    var opponentMove:String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        displayResults()
    }
   
    func getOpponentMove() -> String
    {
        var possibleMoves:[String] = ["rock", "paper", "scissors"]
        var randomIndex:Int = Int(arc4random()%3)
        println("The random integer is \(randomIndex)")
        return possibleMoves[randomIndex]
    }
    
    func displayResults()
    {
        var possibleMoves:[String] = ["rock", "paper", "scissors"]
        var randomIndex:    Int    = Int(arc4random()%3)
        var opponentMove:String    = possibleMoves[randomIndex]
        if self.playerMove == opponentMove
        {
            self.resultLabel.text = "It's a tie."
            self.roshamboImageView.image = UIImage(named: "itsATie")
        }
        else if self.playerMove == "rock" && opponentMove == "paper"
        {
            self.resultLabel.text        = "Paper covers Rock. You lose."
            self.roshamboImageView.image = UIImage(named: "PaperCoversRock")
        }
        else if self.playerMove == "rock" && opponentMove == "scissors"
        {
            self.resultLabel.text       = "Rock crushes Scissors. You win!"
            self.roshamboImageView.image = UIImage(named: "RockCrushesScissors")
        }
        else if self.playerMove == "paper" && opponentMove == "rock"
        {
            self.resultLabel.text      = "Paper covers Rock. You win!"
            self.roshamboImageView.image = UIImage(named: "PaperCoversRock")
        }
        else if self.playerMove == "paper" && opponentMove == "scissors"
        {
            self.resultLabel.text       = "Scissors cut Paper. You lose!"
            self.roshamboImageView.image = UIImage(named: "ScissorsCutPaper")
        }
        else if self.playerMove == "scissors" && opponentMove == "rock"
        {
            self.resultLabel.text       = "Rock crushes Scissors. You lose!"
            self.roshamboImageView.image = UIImage(named: "RockCrushesScissors")
        }
        else if self.playerMove == "scissors" && opponentMove == "paper"
        {
            self.resultLabel.text       = "Scissors cut Paper. You win!"
            self.roshamboImageView.image = UIImage(named: "ScissorsCutPaper")
        }
    }

    @IBAction func playAgain()
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}