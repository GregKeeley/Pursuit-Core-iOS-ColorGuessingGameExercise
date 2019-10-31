//
//  ViewController.swift
//  Color-Guess-Lab
//
//  Created by Gregory Keeley on 10/31/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redGuess: UIButton!
    @IBOutlet weak var greenGuess: UIButton!
    @IBOutlet weak var blueGuess: UIButton!
    
    @IBOutlet weak var mainRandomColor: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var newGame: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var userScore = 0
    var highScore = 0
    
    @IBAction func newGameB(_ sender: Any) {
        let randNumRed = CGFloat.random(in: 0...1)
        let randNumGreen = CGFloat.random(in: 0...1)
        let randNumBlue = CGFloat.random(in: 0...1)
        
        
        let randomColor = UIColor(red: randNumRed, green: randNumGreen, blue: randNumBlue, alpha: 1)
        
        mainRandomColor.backgroundColor = randomColor
        
        if randNumRed > randNumBlue && randNumRed > randNumGreen {
            mainLabel.text = "Red is highest value"
        } else if randNumGreen > randNumRed && randNumGreen > randNumBlue {
            mainLabel.text = "Green is the highest value"
        } else {
            mainLabel.text = "Blue is the highest value"
        }
        newGame.setTitle("Restart", for: .normal)
    }
    

    
}

