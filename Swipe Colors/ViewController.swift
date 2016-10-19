//
//  ViewController.swift
//  Swipe Colors
//
//  Created by Jawad Shuaib on 2016-10-19.
//  Copyright © 2016 Jawad Shuaib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewColors = ["Red", "Blue", "Green", "Yellow", "Purple", "Black"]
    var currentPosition = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let swipeDown = UISwipeGestureRecognizer (target: self, action: #selector (ViewController.detectSwipe(gesture:)))

        let swipeUp = UISwipeGestureRecognizer (target: self, action: #selector (ViewController.detectSwipe(gesture:)))
        
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func detectSwipe (gesture: UIGestureRecognizer) {
        if let swipe = gesture as? UISwipeGestureRecognizer {
            switch swipe.direction {
            case UISwipeGestureRecognizerDirection.down:
                changeColors (direction: "down")
            case UISwipeGestureRecognizerDirection.up:
                changeColors (direction: "up")
            default:
                break
            }
        }
    }
    
    func changeColors (direction: String) {
        
        let pickColor = viewColors[currentPosition]
        if pickColor == "Red" {
            self.view.backgroundColor = UIColor.red
        }
        else if pickColor == "Blue" {
            self.view.backgroundColor = UIColor.blue
        }
        else if pickColor == "Green" {
            self.view.backgroundColor = UIColor.green
        }
        else if pickColor == "Yellow" {
            self.view.backgroundColor = UIColor.yellow
        }
        else if pickColor == "Purple" {
            self.view.backgroundColor = UIColor.purple
        }
        else if pickColor == "Black" {
            self.view.backgroundColor = UIColor.black
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
        
        
        print ("Current Position \(currentPosition)")
        if currentPosition == viewColors.count - 1 {
            if direction == "down" {
                currentPosition = 0
            }
            else if direction == "up" {
                currentPosition -= 1
            }
        }
        else {
            if direction == "down" {
                currentPosition += 1
            } else if direction == "up" {
                if currentPosition == 0 {
                    currentPosition = viewColors.count - 1
                } else {
                    currentPosition -= 1
                }
            }
            
        }
        print ("Incremented Position \(currentPosition)")
    }
}

