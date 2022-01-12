//
//  ViewController.swift
//  HW2.2
//
//  Created by Onix qq on 25.12.21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValueTextField: UITextField!
    @IBOutlet weak var greenValueTextField: UITextField!
    @IBOutlet weak var blueValueTextField: UITextField!
    
    // MARK: - Public Properties
    
    var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        setMinTrackTintColor(for: redSlider, greenSlider, blueSlider)
        setMaxTrackTintColor(for: redSlider, greenSlider, blueSlider)
        
        setRGBSlider()
        setColor()
        setValueLabel(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValueTextField(for: redValueTextField,
                             greenValueTextField,
                             blueValueTextField)
    }
    
    // MARK: - IB Actions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
            case redSlider:
                setValueLabel(for: redValueLabel)
                setValueTextField(for: redValueTextField)
            case greenSlider:
                setValueLabel(for: greenValueLabel)
                setValueTextField(for: greenValueTextField)
            default:
                setValueLabel(for: blueValueLabel)
                setValueTextField(for: blueValueTextField)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(from: redSlider, greenSlider, blueSlider)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setMinTrackTintColor(for sliders: UISlider...) {
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
    
    private func setMaxTrackTintColor(for sliders: UISlider...) {
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
    
    private func setValueLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
                case redValueLabel:
                    redValueLabel.text = getStringSliderValue(
                        for: redSlider
                    )
                case greenValueLabel:
                    greenValueLabel.text = getStringSliderValue(
                        for: greenSlider
                    )
                default:
                    blueValueLabel.text = getStringSliderValue(
                        for: blueSlider
                    )
            }
        }
    }
    
    private func setValueTextField(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
                case redValueTextField:
                    redValueTextField.text = getStringSliderValue(
                        for: redSlider
                    )
                case greenValueTextField:
                    greenValueTextField.text = getStringSliderValue(
                        for: greenSlider
                    )
                default:
                    blueValueTextField.text = getStringSliderValue(
                        for: blueSlider
                    )
            }
        }
    }
    
    private func setRGBSlider() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
    }
    
    private func getStringSliderValue(for slider: UISlider) -> String {
        String(format:"%.2f", slider.value)
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        present(alert, animated: true)
        alert.addAction(okAction)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case redValueTextField:
                greenValueTextField.becomeFirstResponder()
            case greenValueTextField:
                blueValueTextField.becomeFirstResponder()
            default:
                redValueTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let value = Float(text) {
            switch textField {
                case redValueTextField:
                    redSlider.setValue(value, animated: true)
                    setValueLabel(for: redValueLabel)
                case greenValueTextField:
                    greenSlider.setValue(value, animated: true)
                    setValueLabel(for: greenValueLabel)
                default:
                    blueSlider.setValue(value, animated: true)
                    setValueLabel(for: blueValueLabel)
            }
            setColor()
            return
        }
        showAlert(with: "Wrong format!", and: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        textField.inputAccessoryView = toolBar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem (
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        toolBar.items = [flexBarButton, doneButton]
    }
}
