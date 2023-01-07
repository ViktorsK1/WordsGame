//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Виктор Куля on 07.01.2023.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var player1: Player
    @Published var player2: Player
    @Published var words = [String]()
    let word: String
    var isFirst = true
    
    init(player1: Player, player2: Player, word: String) {
        self.player1 = player1
        self.player2 = player2
        self.word = word.uppercased()
    }
    
    func validate(word: String) -> Bool {
        
        let word = word.uppercased()
        guard word != self.word else {
            print("The created word shouldn't be ourcomming word")
            return false
        }
        
        guard !(words.contains(word)) else {
            print("Create a word which wasn't created before")
            return false
        }
        
        guard word.count > 1 else {
            print("The word is too small")
            return false
        }
        
        return true
    }
    
    func wordToChars(word: String) -> [Character] {
        
        var chars = [Character]()
        
        for char in word.uppercased() {
            chars.append(char)
        }
        return chars
    }
    
    func check(word: String) -> Int {
        
        guard self.validate(word: word) else {
            return 0
        }
        var bigWordArray = wordToChars(word: self.word)
        let smallWordArray = wordToChars(word: word)
        var result = ""
        
        for char in smallWordArray {
            if bigWordArray.contains(char) {
                result.append(char)
                var i = 0
                while bigWordArray[i] != char {
                    i += 1
                }
                bigWordArray.remove(at: i)
            } else {
                print("This word couldn't be created")
                return 0
            }
        }
        
        guard result == word.uppercased() else {
            print("Unknown error")
            return 0
        }
        
        words.append(result)
        
        if isFirst {
            player1.score += result.count
        } else {
            player2.score += result.count
        }
        
        isFirst.toggle()
        
        return result.count
        
    }
}
