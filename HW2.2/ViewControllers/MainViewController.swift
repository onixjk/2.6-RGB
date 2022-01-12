//
//  MainViewController.swift
//  HW2.2
//
//  Created by Onix qq on 10.01.22.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(from redSlider: UISlider,
                              _ greenSlider: UISlider,
                              _ blueSlider: UISlider)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController
        else { return }
        if let viewBackgroundColor = view.backgroundColor {
            settingsVC.viewColor = viewBackgroundColor
        }
        settingsVC.delegate = self
    }
    
    private func getRBGSliderValue() {
        
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setColor(from red: UISlider,
                              _ green: UISlider,
                              _ blue: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(red.value),
                                       green: CGFloat(green.value),
                                       blue: CGFloat(blue.value),
                                       alpha: 1)
    }
}
