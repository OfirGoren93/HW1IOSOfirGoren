//
//  GameController.swift
//  HW1OfirGoren
//
//  Created by Ofir Goren on 13/04/2022.
//

import UIKit

class GameController: UIViewController {
    
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet private weak var imageCardLeft: UIImageView!
    @IBOutlet private weak var imageCardRight: UIImageView!
    @IBOutlet private weak var namePlayerOne: UILabel!
    @IBOutlet private weak var namePlayerTwo: UILabel!
    @IBOutlet private weak var scorePlayerOne: UILabel!
    @IBOutlet private weak var scorePlayerTwo: UILabel!
    @IBOutlet private weak var numRound: UILabel!
    var initNamePlayerOne:String?
    var initNamePlayerTwo:String?
    private var imagesCards:[UIImage]?
    private let gameLogic = GameLogic()
    private var nameWinOrDraw:String?
    private let idnetifiarToWinnerController = "ShowWinner"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNamePlayers()
        
        
    }
    
   

    private func initNamePlayers(){
        
       
        if let namePlayerOne = self.initNamePlayerOne , let namePlayerTwo = self.initNamePlayerTwo {
            
            if !namePlayerOne.isEmpty && !namePlayerTwo.isEmpty {
                self.namePlayerOne.text = namePlayerOne
                self.namePlayerTwo.text = namePlayerTwo
            }
        }
        
       
        
    }
    
    
    
    @IBAction func PlayPressed(_ sender: UIButton) {
        self.playBtn.isHidden = true
        self.gameLogic.startGame(imagesCallBack: getDataGameCallBack  ,finelWinCallBack:getFinelWinCallBack)
      
        
        
    }
    lazy var getDataGameCallBack = { [weak self] (cardPlayerOne:UIImage , cardPlayerTwo:UIImage , gameRound:Int , player:GameLogic.Players? , winnerScore:Int? ) -> Void in
        
        if let self = self {
        self.updateCards(cardPlayerOne , cardPlayerTwo)
        self.numRound.text = "\(gameRound)/15"
        self.updateScore(player , winnerScore)
        }
        
    }
  
 
    
    lazy var getFinelWinCallBack = { [weak self] (finelWin:GameLogic.Players?) -> Void in
        if let self = self {
        self.updateFinelWinName(finelWin)
        self.openWinnerController()
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == self.idnetifiarToWinnerController) {
            let destinationWinner = segue.destination as! WinnerController
            destinationWinner.winner = nameWinOrDraw
            
            
            
        }
    }
    
    
    private func openWinnerController() {
        
        performSegue(withIdentifier: self.idnetifiarToWinnerController, sender: self)
        
 
    }
    
    private func updateFinelWinName(_ finelWin:GameLogic.Players?) {
        nameWinOrDraw = gameLogic.getNameStrFinelWin(self.namePlayerOne.text , self.namePlayerTwo.text)
        
        
    }
    
    
    private func updateScore(_ winnerPlayer:GameLogic.Players? , _ winnerScore:Int? ) {
        
        if let winnerPlayer = winnerPlayer , let winnerScore = winnerScore   {
            
            if(GameLogic.Players.PlayerOne == winnerPlayer ) {
                self.scorePlayerOne.text = "\(winnerScore)"
                
            }else {
                self.scorePlayerTwo.text = "\(winnerScore)"
            }
        }
       
        
        
    }
    
    
   private func updateCards(_ cardPlayerOne:UIImage , _ cardPlayerTwo:UIImage ) {
       self.imageCardLeft.image = cardPlayerOne
       self.imageCardRight.image = cardPlayerTwo
       
       
       
    }
    
}
