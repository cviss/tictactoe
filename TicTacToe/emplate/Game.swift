//
//  Game.swift
//  TicTacToe
//
//  Created by System Administrator on 6/29/16.
//  Copyright © 2016 Colicinus. All rights reserved.
//

import Foundation

enum Player: String {
    case X = "X"
    case O = "O"
}

enum CellState {
    case X, O, Empty
}

enum GameState: String {
    case InProgress = ""
    case Won = "Game Over!"
    case Tied = "Cat!"
}

class Game {
    
    init()  {
        //we are simulating setting our board from the internet
        let simulatedBoardStringFromNetwork = "O________" //update this string to different values to test your model serialisation
        self.board = deserialiseBoard(simulatedBoardStringFromNetwork) //your OXGame board model should get set here
        print(self.board)
        if(simulatedBoardStringFromNetwork == serialiseBoard())    {
            print("start\n------------------------------------")
            print("congratulations, you successfully deserialised your board and serialized it again correctly. You can send your data model over the internet with this code. 1 step closer to network OX ;)")
            
            print("done\n------------------------------------")
        }   else    {
            print("start\n------------------------------------")
            print ("your board deserialisation and serialization was not correct :( carry on coding on those functions")
            
            print("done\n------------------------------------")
        }
        
    }
    
    private func serialiseBoard() -> String {
        var boardString: String = ""
        for cell in self.board {
            switch cell {
                case .X:
                    boardString.append("X")
                case .O:
                    boardString.append("O")
                default:
                    boardString.append("_")
            }
        }
        return boardString
    }
    
    private func deserialiseBoard(_ board: String) -> [CellState] {
        var boardArray: [CellState] = []
        for character in board.characters {
            switch character {
                case "X":
                    boardArray.append(.X)
                case "O":
                    boardArray.append(.O)
                default:
                    boardArray.append(.Empty)
            }
        }
        return boardArray
    }
    
    
    static var sharedInstance = Game()
    
    private var board = [CellState](repeating: .Empty, count: 9)
    private var turn = 1
    
    func player() -> Player {
        switch (turn % 2) {
            case 1:
                return Player.X
            default:
                return Player.O
        }
    }
    
    func player(previous: Bool) -> Player {
        if(previous) {
            switch (turn % 2) {
                case 1:
                    return Player.O
                default:
                    return Player.X
            }
        }
        else {
            return player()
        }
    }
    

    func cellState(cell index: Int) -> CellState {
        return board[index]
    }
    
    func cellSet(cell index: Int, state: CellState) {
        board[index] = state
        turn += 1
        
    }
    
    
    func state() -> GameState {
        let won:Bool =
            ((board[0] == board[1]) && (board[1] == board[2]) && (board[0] != .Empty)) ||
            ((board[0] == board[4]) && (board[4] == board[8]) && (board[0] != .Empty)) ||
            ((board[0] == board[3]) && (board[3] == board[6]) && (board[0] != .Empty)) ||
            ((board[1] == board[4]) && (board[4] == board[7]) && (board[1] != .Empty)) ||
            ((board[2] == board[5]) && (board[5] == board[8]) && (board[2] != .Empty)) ||
            ((board[2] == board[4]) && (board[4] == board[6]) && (board[2] != .Empty)) ||
            ((board[3] == board[4]) && (board[4] == board[5]) && (board[3] != .Empty)) ||
            ((board[6] == board[7]) && (board[7] == board[8]) && (board[6] != .Empty))
        
        if(won) {
            return GameState.Won
        }
        else if(turn == 10) {
            return GameState.Tied
        }
        else {
            return GameState.InProgress
        }
    }
    
    func reset() {
        board = [CellState](repeating: .Empty, count: 9)
        turn = 1
    }
}
