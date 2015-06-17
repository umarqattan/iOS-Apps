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
    
    var initMatch:[String] = ["You","Opponent","Result"]
    var match:[String] = []
    
   
    
    var playerMove:  String!
    var opponentMove:String!
    var matchImage:[UIImage] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        displayResults()
    }
    
   
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
    }
    
    
    func displayResults()
    {
        var possibleMoves:[String] = ["rock", "paper", "scissors"]
        var randomIndex:    Int    = Int(arc4random()%3)
        self.opponentMove          = possibleMoves[randomIndex]
        if self.playerMove == self.opponentMove
        {
            self.resultLabel.text = "It's a tie."
            self.roshamboImageView.image = UIImage(named: "itsATie")
        }
        else if self.playerMove == "rock" && self.opponentMove == "paper"
        {
            self.resultLabel.text        = "Paper covers Rock. You lose."
            self.roshamboImageView.image = UIImage(named: "PaperCoversRock")
        }
        else if self.playerMove == "rock" && self.opponentMove == "scissors"
        {
            self.resultLabel.text       = "Rock crushes Scissors. You win!"
            self.roshamboImageView.image = UIImage(named: "RockCrushesScissors")
        }
        else if self.playerMove == "paper" && self.opponentMove == "rock"
        {
            self.resultLabel.text      = "Paper covers Rock. You win!"
            self.roshamboImageView.image = UIImage(named: "PaperCoversRock")
        }
        else if self.playerMove == "paper" && self.opponentMove == "scissors"
        {
            self.resultLabel.text       = "Scissors cut Paper. You lose!"
            self.roshamboImageView.image = UIImage(named: "ScissorsCutPaper")
        }
        else if self.playerMove == "scissors" && self.opponentMove == "rock"
        {
            self.resultLabel.text       = "Rock crushes Scissors. You lose!"
            self.roshamboImageView.image = UIImage(named: "RockCrushesScissors")
        }
        else if self.playerMove == "scissors" && self.opponentMove == "paper"
        {
            self.resultLabel.text       = "Scissors cut Paper. You win!"
            self.roshamboImageView.image = UIImage(named: "ScissorsCutPaper")
        }
    }
    /**
    @IBAction func showHistory(sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("HistoryViewController") as! HistoryViewController
        vc.matchImage.append(self.roshamboImageView.image!)
        vc.match.append(self.playerMove)
        println("My move was \(self.playerMove) and my opponent's move was \(self.opponentMove)")
        vc.match.append(self.opponentMove)
        println("\(vc.match[0]) and \(vc.match[1])")
        presentViewController(vc, animated: true, completion: nil)
        
    }
    **/
    @IBAction func playAgain()
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}