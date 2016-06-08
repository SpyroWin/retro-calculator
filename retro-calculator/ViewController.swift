//
//  ViewController.swift
//  retro-calculator
//
//  Created by spyrowin on 6/7/16.
//  Copyright © 2016 htainmyoaung. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //variables
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    
    //Outlet
    @IBOutlet weak var outputLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
        
    }

    @IBAction func numberPressed(btn:UIButton!){
        btnSound.play()
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
    }

}

