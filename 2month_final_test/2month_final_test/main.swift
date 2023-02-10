//
//  main.swift
//  2month_final_test
//
//  Created by Maksumova Sofia on 8/2/23.
//

import Foundation

//Составить игру крестики и нолики используя инструменты ООП. Создать класс Game подписать на протокол Menu c функцией startGame(), endGame(). Создать 2 наследника Игра против человека и Игра против бота. Переопределить startGame в наследниках и задать внутри соответствующую логику. В игре против человека должны создаваться ридлайны для 2 игроков по очереди. В игре против бота, только ридлайны для 1 пользователя, остальное компьютер ставит рандомно. После того, как все места будут заняты выводить в консоль победителя, если ничья, то выводить что ничья и завершать игру. Создайте 3 массива и принтуйте постоянно.

protocol Menu {
    func startGame()
    func endGame()
}

class Game {
    var board = [[String]](repeating: [String](repeating: " ", count: 3), count: 3)
    var currentPlayer = "X"

    func checkWinner() -> String? {
        let rows = board + board
        let diagonals = [[board[0][0], board[1][1], board[2][2]], [board[0][2], board[1][1], board[2][0]]]
        let checks = rows + diagonals
        for check in checks {
            if check == ["X", "X", "X"] {
                return "X"
            } else if check == ["O", "O", "O"] {
                return "O"
            }
        }
        return nil
    }
}

class HumanVsHuman: Game, Menu {
     func startGame() {
        print("Start game: Human vs Human")
         
        while checkWinner() == nil {
            printBoard()
        print("Игрок \(currentPlayer), сделайте ход(строка, столбец):")
            let row = Int(readLine()!)!
            let col = Int(readLine()!)!
            board[row][col] = currentPlayer
            currentPlayer = currentPlayer == "X" ? "O" : "X"
        }
        endGame()
    }

    func printBoard() {
        for row in board {
            print(row)
        }
    }

     func endGame() {
        if let winner = checkWinner() {
            print("Поздравляем! Игрок \(winner) победил")
        } else {
            print("Ничья")
        }
    }
}

class HumanVsBot: Game, Menu {
     func startGame() {
        print("Start game: Human vs Bot")
        print("Игрок \(currentPlayer), сделайте ход(строка, столбец):")
        while checkWinner() == nil {
            if currentPlayer == "X" {
                printBoard()
                let row = Int(readLine()!)!
                let col = Int(readLine()!)!
                board[row][col] = currentPlayer
            } else {
                let row = Int.random(in: 0..<3)
                let col = Int.random(in: 0..<3)
                board[row][col] = currentPlayer
            }
            currentPlayer = currentPlayer == "X" ? "O" : "X"
        }
        endGame()
    }

    func printBoard() {
        for row in board {
            print(row)
        }
    }

     func endGame() {
        if let winner = checkWinner() {
            print("Поздравляем! Игрок \(winner) победил")
        } else {
            print("Ничья")
        }
    }
}

let game1 = HumanVsHuman()
game1.startGame()

let game2 = HumanVsBot()
game2.startGame()
