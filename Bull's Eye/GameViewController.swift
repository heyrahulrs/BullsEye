//
//  GameViewController.swift
//  Bull's Eye
//
//  Created by Rahul on 7/5/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var roundInfoLabel: UILabel!
    @IBOutlet weak var scoreInfoLabel: UILabel!

    var sliderValue: Int = 0
    var targetValue: Int = 0

    var score: Int = 0
    var currentRound: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startNewRound()
        updateLabels()
        
        let thumbImageNormal = #imageLiteral(resourceName: "Slider Thumb Image Normal") //UIImage(named: "Slider Thumb Image Normal")
        let thumbImageHighlighted = #imageLiteral(resourceName: "Slider Thumb Image Highlighted") //UIImage(named: "Slider Thumb Image Highlighted")
        
        let minimumTrackImage = #imageLiteral(resourceName: "Slider Minimum Track Image") //UIImage(named: "Slider Minimum Track Image")
        let maximumTrackImage = #imageLiteral(resourceName: "Slider Maximum Track Image") //UIImage(named: "Slider Maximum Track Image")
        

        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        slider.setMinimumTrackImage(minimumTrackImage, for: .normal)
        slider.setMaximumTrackImage(maximumTrackImage, for: .normal)

    }
    
    @IBAction func didTapHitMeButton() {
        
        let difference = abs(targetValue - sliderValue)
        
        var title: String = ""
        
        var points = 0
        
        if difference < 20 {
            points = 100 - difference
        }
        
        if difference == 0 {
            points += 100
            title = "Excellent!"
        }else if difference <= 2 {
            points += 50
            title = "Very close!"
        }else if difference <= 10 {
            points += 20
            title = "That was close"
        }else{
            title = "Better luck next time"
        }
        
        score += points
        
        let message = "Your target was \(targetValue), your slider is placed at \(sliderValue). You scored \(points) in this round and your total score is \(score)."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            self.startNewRound()
            self.updateLabels()
        }
        
        alert.addAction(action)
        
        show(alert, sender: nil)
    }
    
    @IBAction func didTapStartOverButton() {
        currentRound = 0
        score = 0
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved() {
        sliderValue = Int(slider.value)
    }

    func startNewRound() {
        sliderValue = 50
        slider.value = 50
        targetValue = Int.random(in: 1...100)
        currentRound += 1
    }
    
    func updateLabels() {
        targetValueLabel.text = "\(targetValue)"
        roundInfoLabel.text = "Round: \(currentRound)"
        scoreInfoLabel.text = "Score: \(score)"
    }

}

