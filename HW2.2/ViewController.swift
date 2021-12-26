//
//  ViewController.swift
//  HW2.2
//
//  Created by Onix qq on 25.12.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .systemRed
        redSlider.maximumTrackTintColor = .systemGray

        greenSlider.minimumTrackTintColor = .systemGreen
        greenSlider.maximumTrackTintColor = .systemGray

        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .systemGray
        
        rgbSlider()
    }
    
    @IBAction func rgbSlider() {
        changeColor()
        getStringSliderValue()
    }
    
    private func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func getStringSliderValue() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}
