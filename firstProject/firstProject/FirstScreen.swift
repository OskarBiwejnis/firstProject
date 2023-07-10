//
//  FirstScreen.swift
//  firstProject
//
//  Created by Oskar Biwejnis on 03/07/2023.
//

import UIKit



class FirstScreen: UIViewController  {
    
    private enum Strings {
        static let labelName = "LABEL"
        static let buttonName = "BUTTON"
        static let textFieldName = "TEXT FIELD"
        static let buttonToSecondScreenName = "NEXT SCREEN"
        static let requestTextNotificationKey = "requestTextNotification"
        static let sendTextNotificationKey = "sendTextNotification"
    }
    
    private enum Constants {
        static let labelToTextFieldDistance = -100
        static let buttonToTextFieldDistance = 50
        static let buttonToButtonDistance = 50
     }
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.labelName
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Strings.buttonName, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.text = Strings.textFieldName
        textField.isUserInteractionEnabled = true
        return textField
    }()
    
    private let buttonToSecondScreen: UIButton = {
        let buttonToSecondScreen = UIButton(type: .system)
        buttonToSecondScreen.translatesAutoresizingMaskIntoConstraints = false
        buttonToSecondScreen.setTitle(Strings.buttonToSecondScreenName, for: .normal)
        buttonToSecondScreen.addTarget(self, action: #selector(buttonToSecondScreenTapped), for: .touchUpInside)
        return buttonToSecondScreen
    }()
    
    var secondScreen = SecondScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(sendBackNotification), name: Notification.Name(Strings.requestTextNotificationKey), object: nil)
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(buttonToSecondScreen)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: CGFloat(Constants.labelToTextFieldDistance)),
            
            textField.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: CGFloat(Constants.buttonToTextFieldDistance)),
            
            buttonToSecondScreen.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            buttonToSecondScreen.topAnchor.constraint(equalTo: button.bottomAnchor, constant: CGFloat(Constants.buttonToButtonDistance))
        ])
    }
    
    @objc func sendBackNotification() {
        NotificationCenter.default.post(name: Notification.Name(Strings.sendTextNotificationKey), object: nil, userInfo: ["text" : textField.text] )
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        label.text = textField.text
    }

    @objc func buttonToSecondScreenTapped(_ sender: UIButton) {
        navigationController?.pushViewController(secondScreen, animated: false)
    }
}

