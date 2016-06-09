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

    //Enum
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    //variables
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    //Outlet
    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet weak var launchbg: UIImageView!
    @IBOutlet weak var welcomeUI: UIStackView!
    @IBOutlet weak var welcomBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLbl.text = ""
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
        
    }
    
    @IBAction func onWelcomePressed(sender: AnyObject){
        launchbg.hidden = true
        welcomeUI.hidden = true
        welcomBtn.hidden = true
    }

    @IBAction func onClearPressed(sender: AnyObject) {
        outputLbl.text = ""
        runningNumber = ""
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        result = ""
    }
    
    @IBAction func numberPressed(btn:UIButton!){
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(Operation.Equals)
    }
    
    func processOperation(var op: Operation){
        playSound()
        
        if (currentOperation != Operation.Empty){
            //Run some math
            if (runningNumber != ""){ //checking if two operators are pressed consecutively
                rightValStr = runningNumber
                runningNumber = ""
                
                if (currentOperation == Operation.Multiply){
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }else if (currentOperation == Operation.Divide){
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }else if (currentOperation == Operation.Add){
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }else if (currentOperation == Operation.Subtract){
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                leftValStr = result
                if (op == Operation.Equals){
                    op = Operation.Empty
                    leftValStr = ""
                }
                outputLbl.text = result
            }
            
            currentOperation = op
            
            
        }else{
            //This is the first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound(){
        if (btnSound.playing){
            btnSound.stop()
        }
        btnSound.play()
    }

}

