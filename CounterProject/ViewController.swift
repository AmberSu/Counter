//
//  ViewController.swift
//  CounterProject
//
//  Created by MacOS on 13/11/2017.
//  Copyright © 2017 amberApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var time: UILabel!
    var timer = Timer()
    var seconds = 7200
    var isTimerRunning = false
    var resumeTapped = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            isTimerRunning = false
        } else {
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
        }
    }
    
    @IBAction func resetTimer(_ sender: UISwipeGestureRecognizer) {
        timer.invalidate()
        seconds = 7200
        time.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func updateTimer() {
        seconds -= 1
        time.text = timeString(time: TimeInterval(seconds))
    }

    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

