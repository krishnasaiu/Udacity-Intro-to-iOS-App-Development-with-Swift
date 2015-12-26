//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Krishna Sai on 12/24/15.
//  Copyright © 2015 Krishna Sai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var activePlayer = 1 // 1: O 2: X
    
    var gameState = [Int](count: 9, repeatedValue: 0)
    
    var gameActive = true
    
    var moves = 0
    
    var winningCombinations =  [[0, 1, 2],
                                [3, 4, 5],
                                [6, 7, 8],
                                [0, 3, 6],
                                [1, 4, 7],
                                [2, 5, 8],
                                [0, 4, 8],
                                [2, 4, 6]]
    
    @IBAction func button(sender: AnyObject) {
        
        if moves == 8 {
            gameOverLabel.text = "Draw!!"
            gameOverLabel.hidden = false
            self.playAgainButton.hidden = false
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                
                self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x - 400, self.playAgainButton.center.y)
            })
        }
        
        if gameState[sender.tag] == 0 && gameActive {
            moves++
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "O.png"), forState: .Normal)
                 gameState[sender.tag] = activePlayer
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "X.png"), forState: .Normal)
                 gameState[sender.tag] = activePlayer
                activePlayer = 1
            }
            
            let result = hasWinner()
            if result != 0 {
                gameOverLabel.text = "Player \(result) won!!"
                gameOverLabel.hidden = false
                self.playAgainButton.hidden = false
                UIView.animateWithDuration(1, animations: { () -> Void in
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                    
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x - 400, self.playAgainButton.center.y)
                })
            }
        }
    }
    
    func hasWinner() -> Int {
        for combination in winningCombinations {
            if gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[2]] != 0 {
                gameActive = false
                return gameState[combination[0]]
            }
        }
        return 0
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        gameState = [Int](count: 9, repeatedValue: 0)
        activePlayer = 1 // 1: O 2: X
        gameActive = true
        moves = 0
        
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
        var buttonToClear: UIButton
        
        for var i = 0; i < 9; i++ {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

