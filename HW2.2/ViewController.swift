//
//  ViewController.swift
//  HW2.2
//
//  Created by Onix qq on 25.12.21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    //MARK: - IB Actions
    
    @IBAction func rgbSlider(_ slider: UISlider) {
        setColor()
        switch slider {
            case redSlider:
                redLabel.text = getString(redSlider)
            case greenSlider:
                greenLabel.text = getString(greenSlider)
            default:
                blueLabel.text = getString(blueSlider)
        }
    }
    
    //MARK: - Private Methods
    
    private func changeMinTrackTinColor(for sliders: UISlider...) {
        sliders.forEach { slider in
            switch slider {
                case redSlider:
                    redSlider.minimumTrackTintColor = .systemRed
                case greenSlider:
                    greenSlider.minimumTrackTintColor = .systemGreen
                default:
                    blueSlider.minimumTrackTintColor = .blue
            }
        }
    }
    
    private func changeMaxTrackTinColor (for sliders: UISlider...) {
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
                    redLabel.text = getString(redSlider)
                case greenLabel:
                    greenLabel.text = getString(greenSlider)
                default:
                    blueLabel.text = getString(blueSlider)
            }
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    private func getString(_ slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
