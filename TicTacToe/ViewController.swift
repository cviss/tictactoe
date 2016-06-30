//
//  ViewController.swift
//  TicTacToe
//
//  Created by System Administrator on 6/27/16.
//  Copyright © 2016 Colicinus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    var oImage = UIImage(named: "o")
    var xImage = UIImage(named: "x")

    //Initialize Button Objects\\
    @IBOutlet weak var turnImage: UIImageView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var board: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func resetView() {
        for subview in self.board.subviews {
            if let button = subview as? UIButton {
                print(button.imageView?.image)
                button.setImage(nil, for: [])
            }
        }
        turnImage.image = xImage
        self.winLabel.text = ""
        self.game.reset()
    }

    
    
    @IBAction func cellPressed(_ sender: UIButton) {
        if(game.state() == .InProgress) {
            if(game.cellState(cell: sender.tag) == .Empty) {
                switch game.player() {
                    case .X:
                        sender.setImage(xImage, for: [])
                        game.cellSet(cell: sender.tag, state: .X)
                        turnImage.image = oImage
                    default:
                        sender.setImage(oImage, for:[])
                        game.cellSet(cell: sender.tag, state: .O)
                        turnImage.image = xImage
                }
            }
        }
        if(game.state() == .Won){
            let winAlert = UIAlertController(title: "\(game.player(previous: true).rawValue) Wins!", message: "Game Over", preferredStyle: UIAlertControllerStyle.alert)
            let resetAction = UIAlertAction(title: "New Game", style: .default, handler: { (action) in
                self.resetView()
                self.game.reset()
            })
            winAlert.addAction(resetAction)
            self.present(winAlert, animated: true, completion: nil)
            print("won run")
        }
        else if(game.state() == .Tied) {
            let winAlert = UIAlertController(title: "CAT!", message: "Game Over", preferredStyle: UIAlertControllerStyle.alert)
            let resetAction = UIAlertAction(title: "New Game", style: .default, handler: { (resetAction) in
                self.resetView()
                self.game.reset()
            })
            winAlert.addAction(resetAction)
            self.present(winAlert, animated: true, completion: nil)
            
        }
        winLabel.text = game.state().rawValue
    }
    

    
    //Reset Board and Win Label on Press\\
    
    
    @IBAction func newGamePressed(_ sender: AnyObject) {
        self.resetView()
        game.reset()
    }
}

