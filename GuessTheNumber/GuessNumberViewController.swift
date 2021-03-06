//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Nathakorn on 8/26/17.
//
//

import UIKit

class GuessNumberViewController: UIViewController{
    
    @IBOutlet var numberField:[UILabel]!
    @IBOutlet weak var guessView:UITextView!
    @IBOutlet weak var numPad: NumPad!
    
    let numberSet = NumberSet()
    
    var numCount = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for number in numberField {
            number.setBottomBorder(borderColor: UIColor.black)
        }
        self.numPad.delegate = self
    }
}

extension GuessNumberViewController: NumPadDelegate {
    
    func numberPressed(_ numPad: NumPad, number: Int) {
        if numCount == 4 && self.numberField[numCount].text != "" {
            return
        }
        self.numberField[numCount].text = "\(number)"
        numCount += numCount == 4 ? 0 : 1
    }
    
    func checkPressed(_ numPad: NumPad) {
        self.checkAnswer()
    }
    
    func deletePressed(_ numPad: NumPad) {
        
        if self.numberField[numCount].text == "" {
            numCount -= numCount == 0 ? 0 : 1
        }
        self.numberField[numCount].text = ""
    }
    
    func checkAnswer() {
        var userAnswer:[Int] = []
        for field in numberField {
            guard let number = Int(field.text!) else { return  }
            userAnswer.append(number)
        }
        for number in numberField {
            number.text = ""
        }
        self.numCount = 0
        self.guessView.attributedText = self.numberSet.checkNumberSet(userNumbers: userAnswer)
    }
    
}




