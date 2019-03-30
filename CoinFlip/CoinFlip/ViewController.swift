//
//  ViewController.swift
//  CoinFlip
//
//  Created by Konstantin Hristev on 2019-03-22.
//  Copyright © 2019 Konstantin Hristev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstPress: Bool = true // Tracks the user pressing Flip for the first time
    var prevSide: Int = 0   // Tracks what side was previously flipped
    
    @IBOutlet weak var TailsLbl: UILabel!
    @IBOutlet weak var HeadsLbl: UILabel!
    @IBOutlet weak var HeadsCoin: UIImageView!
    @IBOutlet weak var TailsCoin: UIImageView!
    
    // All sides invisible when app launches
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TailsLbl.alpha = 0
        self.TailsCoin.alpha = 0
        self.HeadsLbl.alpha = 0
        self.HeadsCoin.alpha = 0
        
    }
    
    @IBAction func FlipBtn(_ sender: UIButton) {
        let num = Int.random(in: 0 ... 1)
        
        // First click of button, show inital coin
        if(firstPress) {
            firstPress = false
            
            // First coin is HEADS
            if(num == 0) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.TailsLbl.alpha = 0
                    self.TailsCoin.alpha = 0
                    self.HeadsLbl.alpha = 1
                    self.HeadsCoin.alpha = 1
                    
                }, completion: nil)
            }
            
            // First coin is TAILS
            else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.HeadsLbl.alpha = 0
                    self.HeadsCoin.alpha = 0
                    self.TailsLbl.alpha = 1
                    self.TailsCoin.alpha = 1
                }, completion: nil)
            }
        }
        
        // Side flipped is equal to the previous side flipped
        else {
            if(prevSide == num) {
                
                // HEADS is flipped
                if(num == 0) {
                    
                    self.TailsCoin.alpha = 0
                    UIView.transition(with: HeadsCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.HeadsCoin.alpha = 1
                    
                    // Refresh the label
                    self.HeadsLbl.alpha = 0
                    self.TailsLbl.alpha = 0
                    UIView.animate(withDuration: 0.3, animations: {
                        self.TailsLbl.alpha = 0
                        self.HeadsLbl.alpha = 1
                    }, completion: nil)
                    
                  prevSide = num
                }
                
                // TAILS is flipped
                else {
                
                    self.HeadsCoin.alpha = 0
                    UIView.transition(with: TailsCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                
                    self.TailsCoin.alpha = 1
                
                    // Refresh the label
                    self.HeadsLbl.alpha = 0
                    self.TailsLbl.alpha = 0
                    UIView.animate(withDuration: 0.3, animations: {
                        self.HeadsLbl.alpha = 0
                        self.TailsLbl.alpha = 1
                    }, completion: nil)
                    
                    prevSide = num
                }
            }
            
            /// Side flipped is different than the previous side flipped
            else {
                
                // HEADS is flipped
                if(num == 0) {
                    
                    UIView.transition(with: TailsCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.TailsCoin.alpha = 0
                    self.HeadsCoin.alpha = 1
                    UIView.transition(with: HeadsCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)

                    // Refresh the label
                    self.HeadsLbl.alpha = 0
                    self.TailsLbl.alpha = 0
                    UIView.animate(withDuration: 0.3, animations: {
                        self.TailsLbl.alpha = 0
                        self.HeadsLbl.alpha = 1
                    }, completion: nil)
                    
                    prevSide = num
                }
                    
                // TAILS is flipped
                else {
                    
                    UIView.transition(with: HeadsCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    self.TailsCoin.alpha = 1
                    self.HeadsCoin.alpha = 0
                    UIView.transition(with: TailsCoin, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                    
                    // Refresh the label
                    self.HeadsLbl.alpha = 0
                    self.TailsLbl.alpha = 0
                    UIView.animate(withDuration: 0.3, animations: {
                        self.TailsLbl.alpha = 1
                        self.HeadsLbl.alpha = 0
                    }, completion: nil)
                    
                    prevSide = num
                }
            }
        }
        
        
    }
}
