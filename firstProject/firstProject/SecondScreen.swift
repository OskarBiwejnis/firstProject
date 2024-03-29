//
//  SecondScreen.swift
//  firstProject
//
//  Created by Oskar Biwejnis on 04/07/2023.
//

import UIKit


class SecondScreen: UIViewController {
    
    private enum Strings {
        static let labelName = "LABEL"
        static let buttonName = "BUTTON"
        static let requestTextNotificationKey = "requestTextNotification"
        static let sendTextNotificationKey = "sendTextNotification"
    }
    
    private enum Constants {
        static let buttonToLabelDistance = 50
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(didSendText), name: Notification.Name(Strings.sendTextNotificationKey), object: nil)
        view.backgroundColor = .systemGreen
        view.addSubview(label)
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: CGFloat(Constants.buttonToLabelDistance))
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name(Strings.requestTextNotificationKey), object: nil)
    }
    
    @objc func didSendText(_ notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let text = userInfo["text"] as? String {
                label.text = text
                }
            }
    }
}
