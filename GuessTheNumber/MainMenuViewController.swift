//
//  MainMenuViewController.swift
//  GuessTheNumber
//
//  Created by Nathakorn on 9/2/17.
//
//

import UIKit

class MainMenuViewController: UIViewController {
    
    @IBAction func playButtonClicked(_ sender:UIButton) {
        self.performSegue(withIdentifier: Constant.SEGUE_IDENTIFIER_TO_GAME, sender: self)
    }
    
    @IBAction func moreButtonClicked(_ sender:UIButton) {
        self.performSegue(withIdentifier: Constant.SEGUE_IDENTIFIER_TO_MORE, sender: self)
    }

}
