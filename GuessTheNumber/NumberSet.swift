//
//  NumberSet.swift
//  GuessTheNumber
//
//  Created by Nathakorn on 8/26/17.
//
//

import Foundation
import UIKit

class NumberSet {
    
    var numbers:[Int] = []
    
    init() {
        for _ in 0...4 {
            self.numbers.append(randomInt(num: 10))
        }
    }
    
    func checkNumberSet(userNumbers: [Int]!) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "")
        if self.numbers.elementsEqual(userNumbers) { return NSAttributedString(string: "YOUWIN") }
        for i in 0...4 {
            let userString = "\(userNumbers[i])"
            if self.numbers[i] == userNumbers[i] {
                attributedString.append(userString.toAttributedString(Color: UIColor.green))
                continue
            }else if self.numbers.filter({$0 == userNumbers[i]}).count > 0 {
                attributedString.append(userString.toAttributedString(Color: UIColor.yellow))
                continue
            }else {
                attributedString.append(userString.toAttributedString(Color: UIColor.red))
                continue
            }
        }
        attributedString.addAttributes([NSFontAttributeName: UIFont(name: "Helvetica", size: 50)!], range: NSMakeRange(0, attributedString.length))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
    
    private func randomInt(num:Int) -> Int {
        return Int(arc4random_uniform(UInt32(num)))
    }
    
}
