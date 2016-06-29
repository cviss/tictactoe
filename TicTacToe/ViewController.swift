//
//  ViewController.swift
//  TicTacToe
//
//  Created by System Administrator on 6/27/16.
//  Copyright © 2016 Colicinus. All rights reserved.
//

import UIKit

class pos {
    
    enum state {
        case x
        case o
        case empty
    }
    
    var value = state.empty
}

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
        winLabel.text = game.state().rawValue
    }
    

    
    //Reset Board and Win Label on Press\\
    @IBAction func resetPressed(_ sender: AnyObject) {
        
        for subview in board.subviews {
            print("hi")
            if let button = subview as? UIButton {
                print(button.imageView?.image)
                button.setImage(nil, for: [])
            }
        }
        
        winLabel.text = ""
        game.reset()
    }


}

