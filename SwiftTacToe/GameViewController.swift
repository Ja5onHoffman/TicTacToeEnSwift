//
//  GameViewController.swift
//  SwiftTacToe
//
//  Created by Jason Hoffman on 2/13/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIAlertViewDelegate {
    
    var selectedButtonColumn: Int?
    var selectedButtonRow: Int?
    var gameBoard = Array<Array<Int>>()
    var buttonIndex = [NSArray]()
    var playerTurn: Bool?
    var playerIsX: Bool = false
    var playerIsO: Bool = false
    var playerScore: Int = 0
    var computerScore: Int = 0
    var turn: Int = 0
    var winner: Int?
    let gridView: GridView?
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationController?.navigationBarHidden = true
        self.playerScoreLabel.text = String(playerScore)
        self.computerScoreLabel.text = String(computerScore)
        
        self.gameBoard = [[0,0,0],
                          [0,0,0],
                          [0,0,0]]
        
        self.buttonIndex = [[self.button1, self.button2, self.button3],
                            [self.button4, self.button5, self.button6],
                            [self.button7, self.button8, self.button9]]
    
     
    }
    
    @IBAction func buttonSelected(sender: UIButton) {
        println("Button selected")
        
        var column: Int = 0
        var row: Int = 0
        
        // Increment turn 
        self.turn++
        
        // Capture row and column of selected cell
        let button: UIButton = sender
        for (var i = 0; i<3; i++) {
            for (var j = 0; j<3; j++) {
                if button == self.buttonIndex[i][j] as NSObject {
                    row = i
                    column = j
                    println("i is " + String(i) + ", j is " + String(j))
                }
            }
        }
            
        // Player is always '1' on gameboard regardless if playing as X or O
        if self.gameBoard[row][column] as NSObject == 0 {
            if self.playerIsX {
                let image = UIImage(named: "xImage")
                button.setBackgroundImage(image, forState: UIControlState.Normal)
            } else {
                let image = UIImage(named: "oImage")
                button.setBackgroundImage(image, forState: UIControlState.Normal)
            }

            self.gameBoard[row][column] = 1
            self.playerTurn = false
            self.randomTurn()
            
            println(self.gameBoard)
        }
    }
    
    @IBAction func restart(sender: UIButton) {
        if self.playerScore > 0 {
        let alert = UIAlertView(title: "You sure?", message: "Restarting the game will cost one point", delegate: self, cancelButtonTitle: "Nevermind..", otherButtonTitles: "DO IT!")
        alert.show()
        self.clearBoard()
        } else {
            let alert = UIAlertView(title: "No ponts.", message: "Restarting costs one point. You don't have any points", delegate: self, cancelButtonTitle: "K")
            alert.show()
        }
    }
    
    
    
    func randomTurn() {
        var emptyCells = Array<Array<Int>>()
        self.turn++
        
        for (var i = 0; i < 3; i++) {
            for (var j = 0; j < 3; j++) {
                if self.gameBoard[i][j] == 0 {
                    emptyCells.append([i,j])
                }
            }
        }
        
        if emptyCells.count > 0 {
            var r1: Int = Int(arc4random_uniform(UInt32(emptyCells.count)))
            var num = emptyCells[r1]
            
            var image: UIImage?
            if self.playerIsX {
                image = UIImage(named: "oImage")
            } else {
                image = UIImage(named: "xImage")
            }
            
            let button = self.buttonIndex[num[0]][num[1]] as UIButton
            button.setBackgroundImage(image, forState: UIControlState.Normal)
            self.gameBoard[num[0]][num[1]] = 2
            self.playerTurn = true
        } else {
            println("Game over")
        }
        
         self.checkForWinner()
    }
    
   
    func checkForWinner() {
        
        println("turn " + String(self.turn))
        var gameBoard = self.gameBoard
        
        if self.turn >= 5 {
            if gameBoard[0][0] == gameBoard[0][1] && gameBoard[0][1] == gameBoard[0][2] {
                if self.playerIsX || self.playerIsO {
                    println("Player wins!")
                    winner = 1
                    self.endGame()
                } else {
                    println("Computer wins!")
                    winner = 0
                    self.endGame()
                }
            } else if gameBoard[1][0] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[1][2] {
                if self.playerIsX || self.playerIsO {
                    println("Player wins!")
                    winner = 1
                    self.endGame()
                } else {
                    println("Computer wins!")
                    winner = 0
                    self.endGame()
                }

            } else if gameBoard[2][0] == gameBoard[2][1] && gameBoard[2][1] == gameBoard[2][2] {
                if self.playerIsX || self.playerIsO {
                    println("Player wins!")
                    winner = 1
                    self.endGame()
                } else {
                    println("Computer wins!")
                    winner = 0
                    self.endGame()
                }

            } else if gameBoard[0][0] == gameBoard[1][0] && gameBoard[1][0] == gameBoard[2][0] {
                if self.playerIsX || self.playerIsO {
                    println("Player wins!")
                    winner = 1
                    self.endGame()
                } else {
                    println("Computer wins!")
                    winner = 0
                    self.endGame()
                }

            } else if gameBoard[0][1] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[2][1] {
                if self.playerIsX || self.playerIsO {
                    println("Player wins!")
                } else {
                    println("Computer wins!")
                    winner = 0
                    self.endGame()
                }

            } else if gameBoard[0][2] == gameBoard[1][2] && gameBoard[1][2] == gameBoard[2][2] {
                if self.playerIsX || self.playerIsO {
                    println("Player wins!")
                    winner = 1
                    self.endGame()
                } else {
                    println("Computer wins!")
                    winner = 0
                    self.endGame()
                }

            } else if gameBoard[0][0] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[2][2] {
                if self.playerIsX || self.playerIsO {
                    println("Player wins!")
                    winner = 1
                    self.endGame()
                } else {
                    println("Computer wins!")
                    winner = 0
                    self.endGame()
                }

            } else if gameBoard[0][2] == gameBoard[1][1] && gameBoard[1][1] == gameBoard[2][0] {
                if self.playerIsX || self.playerIsO {
                    println("Player wins!")
                    winner = 1
                    self.endGame()
                } else {
                    println("Computer wins!")
                    winner = 0
                    self.endGame()
                }
            }
        }
    }
    
    func endGame() {
        if winner == 1 {
            self.playerScore++
            self.playerScoreLabel.text = String(self.playerScore)
            
            let hudView: HudView = HudView.hudInView(self.view, message: "Player won!", animated: true)
            println(hudView.isFirstResponder())
            
        } else {
            self.computerScore++
            self.computerScoreLabel.text = String(self.computerScore)
            
            let hudView: HudView = HudView.hudInView(self.view, message: "Computer won!", animated: true)
    
        }
    }
    
    func clearBoard() {
        self.gameBoard = [[0,0,0],
                          [0,0,0],
                          [0,0,0]]
        
        for (var i = 0; i < 2; i++) {
            for (var j = 0; j < 2; j++) {
                if self.buttonIndex[i][j].backgroundImage != nil {
                    self.buttonIndex[i][j].setBackgroundImage(nil, forState: UIControlState.Normal)
                }
            }
        }
    }
    
    func lockGame() {
        // Stop game from continuing
    }
}


