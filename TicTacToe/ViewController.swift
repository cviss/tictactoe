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
    
    var turn: Int = 0
    
    enum gameState: String {
        case ended = "Game Over"
        case tie = "Tie"
        case playing = ""
    }
    var ended: gameState = gameState.playing

    //Initialize Button Objects\\
    @IBOutlet weak var turnImage: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    
    
    //Initialize Position Objects for each Tile\\
    let position1 = pos()
    let position2 = pos()
    let position3 = pos()
    let position4 = pos()
    let position5 = pos()
    let position6 = pos()
    let position7 = pos()
    let position8 = pos()
    let position9 = pos()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
    
    //Create Function to Test for a Win\\
    func testForWin() {
        if  ((position1.value == position2.value) && (position2.value == position3.value) && (position1.value != .empty)) ||
            ((position1.value == position5.value) && (position5.value == position9.value) && (position1.value != .empty)) ||
            ((position1.value == position4.value) && (position4.value == position7.value) && (position1.value != .empty)) ||
            ((position2.value == position5.value) && (position5.value == position8.value) && (position2.value != .empty)) ||
            ((position3.value == position6.value) && (position6.value == position9.value) && (position3.value != .empty)) ||
            ((position3.value == position5.value) && (position5.value == position7.value) && (position3.value != .empty)) ||
            ((position4.value == position5.value) && (position5.value == position6.value) && (position4.value != .empty)) ||
            ((position7.value == position8.value) && (position8.value == position9.value) && (position7.value != .empty)) {
                ended = .ended
        }
        else if((position1.value != .empty) && (position2.value != .empty) && (position3.value != .empty) && (position4.value != .empty)
            && (position5.value != .empty) && (position6.value != .empty) && (position7.value != .empty) && (position8.value != .empty)
            && (position9.value != .empty)){
                ended = .tie
        }
        winLabel.text = ended.rawValue
    }
    
    //Create Function to Update Tiles\\
    func update( _ tile: pos, button: UIButton) {
        if(tile.value == .empty && (ended == .playing)) {
            switch turn {
                case 0:
                    tile.value = .x
                    turn = 1
                    turnImage.image = UIImage(named: "o")
                    button.setImage(UIImage(named: "x"), for: [])
                    testForWin()
                case 1:
                    tile.value = .o
                    turn = 0
                    turnImage.image = UIImage(named: "x")
                    button.setImage(UIImage(named: "o"), for: [])
                    testForWin()
                default:
                    break
            }
        }
    }
    
    
    //Update Images and Stored Values for Tile on Press\\
    @IBAction func button1Press(_ sender: AnyObject) {update(position1, button: button1)}
    @IBAction func button2Press(_ sender: AnyObject) {update(position2, button: button2)}
    @IBAction func button3Press(_ sender: AnyObject) {update(position3, button: button3)}
    @IBAction func button4Press(_ sender: AnyObject) {update(position4, button: button4)}
    @IBAction func button5Press(_ sender: AnyObject) {update(position5, button: button5)}
    @IBAction func button6Press(_ sender: AnyObject) {update(position6, button: button6)}
    @IBAction func button7Press(_ sender: AnyObject) {update(position7, button: button7)}
    @IBAction func button8Press(_ sender: AnyObject) {update(position8, button: button8)}
    @IBAction func button9Press(_ sender: AnyObject) {update(position9, button: button9)}
    
    
    //Reset Board and Win Label on Press\\
    @IBAction func resetPressed(_ sender: AnyObject) {
        position1.value = .empty
        button1.setImage(UIImage(named: "white"), for: [])
        
        position2.value = .empty
        button2.setImage(UIImage(named: "white"), for: [])
        
        position3.value = .empty
        button3.setImage(UIImage(named: "white"), for: [])
        
        position4.value = .empty
        button4.setImage(UIImage(named: "white"), for: [])
        
        position5.value = .empty
        button5.setImage(UIImage(named: "white"), for: [])
        
        position6.value = .empty
        button6.setImage(UIImage(named: "white"), for: [])
        
        position7.value = .empty
        button7.setImage(UIImage(named: "white"), for: [])
        
        position8.value = .empty
        button8.setImage(UIImage(named: "white"), for: [])
        
        position9.value = .empty
        button9.setImage(UIImage(named: "white"), for: [])
        
        winLabel.text = " "
        
        ended = .playing
    }


}

