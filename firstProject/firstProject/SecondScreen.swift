//
//  SecondScreen.swift
//  firstProject
//
//  Created by Oskar Biwejnis on 04/07/2023.
//

import UIKit

class SecondScreen: UIViewController, SendingTextDelegate {
    
    var labelOnSecondScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        labelOnSecondScreen = UILabel()
        labelOnSecondScreen.translatesAutoresizingMaskIntoConstraints = false
        labelOnSecondScreen.text = "LABEL"
        view.addSubview(labelOnSecondScreen)
        
        
        NSLayoutConstraint.activate([
            labelOnSecondScreen.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 0),
            labelOnSecondScreen.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: 0),
        ])
        print("jestem")
         
    }
    
    
    func didSendText(text: String) {
        labelOnSecondScreen.text = text

    }

}
