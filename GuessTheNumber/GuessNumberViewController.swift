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
    @IBOutlet var buttonField:[UIButton]!
    @IBOutlet weak var guessView:UITextView!
    
    var currentTextfieldItem = 0
    var numCount = 0
    var viewModel = GuessNumberViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for number in numberField {
            number.setBottomBorder(borderColor: UIColor.black)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressNum(_ sender:UIButton) {
        if numCount > 4 {
            if sender.tag == 10 {
                numCount = 4
                numberField[numCount].text = ""
            }
            else if sender.tag == 11 {
                
                // should run method check answer here
            }
            return
        }
        if numCount < 0 {
            numCount = 0
        }
        switch sender.tag {
        case 0:
            numberField[numCount].text = "\(sender.tag)"
            numCount+=1
            break
        case 1:
             numberField[numCount].text = "\(sender.tag)"
             numCount+=1
            break
        case 2:
             numberField[numCount].text = "\(sender.tag)"
             numCount+=1
            break
        case 3:
             numberField[numCount].text = "\(sender.tag)"
             numCount+=1
            break
        case 4:
             numberField[numCount].text = "\(sender.tag)"
             numCount+=1
            break
        case 5:
             numberField[numCount].text = "\(sender.tag)"
             numCount+=1
            break
        case 6:
             numberField[numCount].text = "\(sender.tag)"
             numCount+=1
            break
        case 7:
             numberField[numCount].text = "\(sender.tag)"
             numCount+=1
            break
        case 8:
             numberField[numCount].text = "\(sender.tag)"
             numCount+=1
            break
        case 9:
            numberField[numCount].text = "\(sender.tag)"
            numCount+=1
            break
        case 10: // press delete
            if numberField[numCount].text == "" && numCount >= 1 {
                numCount-=1
            }
            numberField[numCount].text = ""
            break
        case 11: // press answer
        break
        default:
            break
        }
       }
}
    




