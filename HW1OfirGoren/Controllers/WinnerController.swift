//
//  WinnerController.swift
//  HW1OfirGoren
//
//  Created by Ofir Goren on 18/04/2022.
//

import UIKit

class WinnerController: UIViewController {

    var winner:String?
    
    @IBOutlet weak var winnerOrDraw: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerOrDraw.text = winner
        // Do any additional setup after loading the view.
    }
 
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
