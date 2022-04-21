//
//  GameLogic.swift
//  HW1OfirGoren
//
//  Created by Ofir Goren on 18/04/2022.
//


import UIKit


class GameLogic {
    
    private var imagesCards:[(card: UIImage ,numCard:Int)]? = []
    private var indexArrayPlayerOne = 0
    private var indexArrayPlayerTwo = 0
    private var gameRound = 0
    private var scorePlayerOne = 0
    private var scorePlayerTwo = 0
    private var listCardsPlayerOne:[(card: UIImage , numCard:Int)] = []
    private var listCardsPlayerTwo:[(card: UIImage , numCard:Int)] = []
    private var MaxNumberRound = 15
    
    enum Players {
        case PlayerOne
        case PlayerTwo
        
    }
    
    init() {
        initImageArray()
        suffleCards()
        initListsCard()
    }
    
    
    private func initImageArray(){
        self.imagesCards = [( #imageLiteral(resourceName: "14A") , 14),(#imageLiteral(resourceName: "2A") , 2),( #imageLiteral(resourceName: "3A"),3),( #imageLiteral(resourceName: "4A"),4),( #imageLiteral(resourceName: "5A"),5),( #imageLiteral(resourceName: "6A"),6),( #imageLiteral(resourceName: "7A"),7),( #imageLiteral(resourceName: "8A"),8), ( #imageLiteral(resourceName: "9A"),9),( #imageLiteral(resourceName: "10A"),10),( #imageLiteral(resourceName: "11A"),11),( #imageLiteral(resourceName: "12A"),12),( #imageLiteral(resourceName: "13A"),13),(#imageLiteral(resourceName: "14C"),14),( #imageLiteral(resourceName: "2C"),2),( #imageLiteral(resourceName: "3C"),3),( #imageLiteral(resourceName: "4C"),4),(#imageLiteral(resourceName: "5C"),5),( #imageLiteral(resourceName: "6C"),6),( #imageLiteral(resourceName: "7C"),7),( #imageLiteral(resourceName: "8C"),8),( #imageLiteral(resourceName: "9C"),9),( #imageLiteral(resourceName: "10C"),10),( #imageLiteral(resourceName: "11C"),11),( #imageLiteral(resourceName: "12C"),12),(#imageLiteral(resourceName: "13C"),13),( #imageLiteral(resourceName: "14B"),14),( #imageLiteral(resourceName: "2B"),2),( #imageLiteral(resourceName: "3B"),3),(#imageLiteral(resourceName: "4B"),4),( #imageLiteral(resourceName: "5B"),5),]
        
        
        
    }
    
    
    private func initListsCard() {
        let arraySPlit = self.imagesCards?.splitInSubArrays(into: 2)
        listCardsPlayerOne = arraySPlit?[0] ?? []
        listCardsPlayerTwo = arraySPlit?[1] ?? []
        
        
    }
    
    
    
    func getNameStrFinelWin(_ namePlayerOne:String? ,_ namePlayerTwo:String?) -> String? {
        let finelWin = getFinelWin()
        
        if let finelWinEnum = finelWin {
            if(Players.PlayerOne == finelWinEnum) {
                return namePlayerOne
            }else {
                return namePlayerTwo
            }
            
        }else {
            return "Draw"
        }
        
    }
    
    
    func startGame(imagesCallBack: @escaping (_ cardPlayerOne:UIImage , _ cardPlayerTwo:UIImage , _ gameRound:Int , _ player:Players? , _ winnerScore:Int? ) -> Void , finelWinCallBack : @escaping (_ finalWin:Players? )->Void) {
        
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {thisTimer in
            self.gameRound += 1
            if(self.gameRound > self.MaxNumberRound) {
                
                thisTimer.invalidate()
                let getFinelWin = self.getFinelWin()
                finelWinCallBack(getFinelWin)
            }else {
                
                
                self.hendlerGame(imagesCallBack: imagesCallBack)
                
                self.indexArrayPlayerOne += 1
                self.indexArrayPlayerTwo += 1
            }
        }
        
    }
    
    
    private func hendlerGame(imagesCallBack: @escaping (_ cardPlayerOne:UIImage , _ cardPlayerTwo:UIImage , _ gameRound:Int , _ player:Players? , _ winnerScore:Int? ) -> Void){
        
        
        
        if(!IsIndexsAreExceeds()) {
            let playerOneImageCard = self.listCardsPlayerOne[self.indexArrayPlayerOne].0
            let playerTwoImageCard = self.listCardsPlayerTwo[self.indexArrayPlayerTwo].0
            let playerOneNumberCard = self.listCardsPlayerOne[self.indexArrayPlayerOne].1
            let playerTwoNumberCard = self.listCardsPlayerTwo[self.indexArrayPlayerTwo].1
            
            
            let whoWin = self.checkWhoWinRound(playerOneNumberCard, playerTwoNumberCard)
            
            self.updateScore(whoWin)
            
            let winnerScore = self.getScoreAccordingWin(whoWin)
            
            // return the
            imagesCallBack(playerOneImageCard , playerTwoImageCard , self.gameRound , whoWin ,winnerScore)
        }
    }
    
    
    
    private func IsIndexsAreExceeds()->Bool {
        
        let sizeListCardsPlayerOne = self.listCardsPlayerOne.count
        let sizeListCardsPlayerTwo = self.listCardsPlayerTwo.count
        
        if(sizeListCardsPlayerOne > indexArrayPlayerOne && sizeListCardsPlayerTwo > indexArrayPlayerTwo ) {
            return false
        }else {
            return true
        }
        
    }
    
    
    private func getScoreAccordingWin(_ namePlayer:Players?) ->Int?{
        
        if let namePlayer = namePlayer {
            if(namePlayer == Players.PlayerOne) {
                return scorePlayerOne
            }else {
                return  scorePlayerTwo
            }
        }
        return nil
        
    }
    
    private func updateScore(_ namePlayer:Players?) {
        
        if let namePlayer  = namePlayer {
            if(namePlayer == Players.PlayerOne) {
                scorePlayerOne += 1
            }else {
                scorePlayerTwo += 1
            }
        }
        
    }
    
    
    private func checkWhoWinRound(_ playerOneCard:Int, _ playerTwoCard:Int) ->Players? {
        
        if(playerOneCard > playerTwoCard) {
            return Players.PlayerOne
        }else if (playerOneCard < playerTwoCard) {
            return Players.PlayerTwo
        }
        
        return nil
    }
    
    
    private func getFinelWin()-> Players? {
        if(scorePlayerOne > scorePlayerTwo) {
            return Players.PlayerOne
        }else if(scorePlayerOne < scorePlayerTwo) {
            return Players.PlayerTwo
        }
        
        return nil
    }
    
    
    
    
    private func suffleCards() {
        self.imagesCards?.shuffle()
    }
    
    
    
    
    
    
}
