//
//  NumPad.swift
//  GuessTheNumber
//
//  Created by Nathakorn on 8/31/17.
//
//

import Foundation
import UIKit

protocol NumPadDelegate:class {
    func numberPressed(_ numPad:NumPad,number:Int) -> Void
    func deletePressed(_ numPad:NumPad) -> Void
    func checkPressed(_ numPad:NumPad) -> Void
}

@IBDesignable class NumPad: UIView {
    
    weak var delegate:NumPadDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth,
                                 UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    @IBAction func pressNum(_ sender:UIButton) {
        if sender.tag == 10 {
            self.delegate?.deletePressed(self)
        } else if sender.tag == 11 {
            self.delegate?.checkPressed(self)
        } else {
            self.delegate?.numberPressed(self, number: sender.tag)
        }
    }
}
