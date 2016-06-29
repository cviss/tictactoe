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
    var emptyImage = UIImage(named: "white")

    //Initialize Button Objects\\
    @IBOutlet weak var turnImage: UIImageView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var board: UIView!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    
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
        button0.setImage(emptyImage, for: [])
        button1.setImage(emptyImage, for: [])
        button2.setImage(emptyImage, for: [])
        button3.setImage(emptyImage, for: [])
        button4.setImage(emptyImage, for: [])
        button5.setImage(emptyImage, for: [])
        button6.setImage(emptyImage, for: [])
        button7.setImage(emptyImage, for: [])
        button8.setImage(emptyImage, for: [])
        
        winLabel.text = ""
        game.reset()
    }


}

