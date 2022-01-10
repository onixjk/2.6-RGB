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
        
        changeMinTrackTintColor(for: redSlider, greenSlider, blueSlider)
        changeMaxTrackTintColor(for: redSlider, greenSlider, blueSlider)
        
        changeColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        changeColor()
        switch sender {
            case redSlider:
                redLabel.text = getStringSliderValue(for: redSlider)
            case greenSlider:
                greenLabel.text = getStringSliderValue(for: greenSlider)
            default:
                blueLabel.text = getStringSliderValue(for: blueSlider)
        }
    }
    
    private func changeMinTrackTintColor(for sliders: UISlider...) {
        sliders.forEach { slider in
            switch slider {
                case redSlider:
                    redSlider.minimumTrackTintColor = .red
                case greenSlider:
                    greenSlider.minimumTrackTintColor = .green
                default:
                    blueSlider.minimumTrackTintColor = .blue
            }
        }
    }
    
    private func changeMaxTrackTintColor(for sliders: UISlider...) {
        sliders.forEach { slider in
            switch slider {
                case redSlider:
                    redSlider.maximumTrackTintColor = .systemGray
                case greenSlider:
                    greenSlider.maximumTrackTintColor = .systemGray
                default:
                    blueSlider.maximumTrackTintColor = .systemGray
            }
        }
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
                case redLabel:
                    redLabel.text = getStringSliderValue(for: redSlider)
                case greenLabel:
                    greenLabel.text = getStringSliderValue(for: greenSlider)
                default:
                    blueLabel.text = getStringSliderValue(for: blueSlider)
            }
        }
    }
    
    private func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func getStringSliderValue(for slider: UISlider) -> String {
        String(format:"%.2f", slider.value)
    }
}
