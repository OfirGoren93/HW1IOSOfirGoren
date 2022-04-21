//
//  ViewController.swift
//  HW1OfirGoren
//
//  Created by Ofir Goren on 13/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var namePlayerOne: UITextField!
    @IBOutlet weak var namePlayerTwo: UITextField!
    @IBOutlet weak var startBtn: UIButton!
    
    private let idnetifiarStartGame = "StartGame"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func StartPressed(_ sender: UIButton) {
        performSegue(withIdentifier: self.idnetifiarStartGame, sender: self)
        
    }
    
    
    @IBAction func unwindMain(_ sender :UIStoryboardSegue) {
        print("1")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == self.idnetifiarStartGame) {
            let destinationGame = segue.destination as! GameController
            
            destinationGame.initNamePlayerOne = self.namePlayerOne.text
            destinationGame.initNamePlayerTwo = self.namePlayerTwo.text
            
            
        }
    }
}

