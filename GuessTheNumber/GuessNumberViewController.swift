//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Nathakorn on 8/26/17.
//
//

import UIKit

class GuessNumberViewController: UIViewController {
    @IBOutlet var numberField:[UITextField]!
    @IBOutlet weak var guessView:UITextView!
    
    var currentTextfieldItem = 0
    var answer = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        numberField[0].becomeFirstResponder()
        for i in 0...4 {
            numberField[i].delegate = self
            numberField[i].tintColor = UIColor.clear
            numberField[i].setBottomBorder(borderColor: UIColor.black)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension GuessNumberViewController:UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        
        if (isBackSpace == -92) {
            print("Backspace was pressed")
            if currentTextfieldItem >= 1 {
                numberField[currentTextfieldItem].text = ""
                currentTextfieldItem-=1
                numberField[currentTextfieldItem].becomeFirstResponder()
            }
            else {}
            return true
        }
        else {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        if newLength > 1 && currentTextfieldItem <= 3 {
            currentTextfieldItem+=1
            numberField[currentTextfieldItem].text = string
            numberField[currentTextfieldItem].becomeFirstResponder()
            return false
        }
        else if currentTextfieldItem == 4 {
            return false
        }
        else {
            return true
        }
        }
    }
}

