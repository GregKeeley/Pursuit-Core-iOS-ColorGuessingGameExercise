//
//  ViewController.swift
//  Color-Guess-Lab
//
//  Created by Gregory Keeley on 10/31/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startImage: UIImageView!
    
    @IBOutlet weak var redGuess: UIButton!
    @IBOutlet weak var greenGuess: UIButton!
    @IBOutlet weak var blueGuess: UIButton!
    
    @IBOutlet weak var mainRandomColor: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var newGame: UIButton!
    
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var highScoreCounter: UILabel!
    
    
    @IBOutlet weak var rValue: UILabel!
    @IBOutlet weak var gValue: UILabel!
    @IBOutlet weak var bValue: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redGuess.isEnabled = false
        greenGuess.isEnabled = false
        blueGuess.isEnabled = false
    }
    
    var userScore = 0
    var highScore = 0
    var highestValueColor = String()
    
    func setHighScore() {
        if userScore > highScore {
            highScore = userScore
            highScoreCounter.text = String("High Score: \(highScore)")
        }
        userScore = 0
    }
    func reset() {
        userScore = 0
        scoreCounter.text = String(userScore)
        
        newGame.setTitle("Tap here to try again", for: .normal)
    }
    
    @IBAction func newGameB(_ sender: UIButton) {
        reset()
        startImage.isHidden = true
        redGuess.isEnabled = true
        greenGuess.isEnabled = true
        blueGuess.isEnabled = true
        
        let randomNumRed = CGFloat.random(in: 0...1)
        let randomNumGreen = CGFloat.random(in: 0...1)
        let randomNumBlue = CGFloat.random(in: 0...1)
        let randomNumRedInt = Double(randomNumRed)
        let randomNumGreenInt = Double(randomNumGreen)
        let randomNumBlueInt = Double(randomNumBlue)
        
        
        rValue.text = String(randomNumRedInt)
        gValue.text = String(randomNumGreenInt)
        bValue.text = String(randomNumBlueInt)
        
        let randomColor = UIColor(red: randomNumRed, green: randomNumGreen, blue: randomNumBlue, alpha: 1)
        
        
        func determineHighestValueColor() {
            if randomNumRed > randomNumBlue && randomNumRed > randomNumGreen {
                highestValueColor = "Red"
            } else if randomNumGreen > randomNumRed && randomNumGreen > randomNumBlue {
                highestValueColor = "Green"
            } else {
                highestValueColor = "Blue"
            }
        }
        
        
        mainRandomColor.backgroundColor = randomColor
        switch sender.tag {
        case 0:
            rValue.text = String(randomNumRedInt)
            gValue.text = String(randomNumGreenInt)
            bValue.text = String(randomNumBlueInt)
            determineHighestValueColor()
            if highestValueColor == "Red" {
                mainLabel.text = "Correct!\nRed is highest value"
                userScore += 1
                scoreCounter.text = String(userScore)
            } else {
                mainLabel.text = "Wrong....\(highestValueColor) is highest value\n Press restart to try again"
                setHighScore()
            }
        case 1:
            rValue.text = String(randomNumRedInt)
            gValue.text = String(randomNumGreenInt)
            bValue.text = String(randomNumBlueInt)
            determineHighestValueColor()
            if highestValueColor == "Green" {
                mainLabel.text = "Correct!\n\(highestValueColor) is highest value"
                userScore += 1
                scoreCounter.text = String(userScore)
                setHighScore()
                
            } else {
                mainLabel.text = "Wrong....Green is highest value\n Press restart to try again"
                setHighScore()
            }
        case 2:
            rValue.text = String(randomNumRedInt)
            gValue.text = String(randomNumGreenInt)
            bValue.text = String(randomNumBlueInt)
            determineHighestValueColor()
            if highestValueColor == "Blue" {
                mainLabel.text = "Blue is the highest value"
                userScore += 1
                scoreCounter.text = String(userScore)
            } else {
                mainLabel.text = "Wrong...\(highestValueColor) is highest value\n Press restart to try again"
                setHighScore()
            }
        default:
            mainLabel.text = "Make your best guess"
        }
        newGame.setTitle("Restart", for: .normal)
    }
}


