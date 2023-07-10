//
//  SecondScreen.swift
//  firstProject
//
//  Created by Oskar Biwejnis on 04/07/2023.
//

import UIKit

class SecondScreen: UIViewController, SendingTextDelegate {
    
    private enum Strings {
        static let labelName = "LABEL"
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LABEL"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGreen
        view.addSubview(label)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
        ])
    }
    
    func didSendText(text: String) {
        label.text = text
    }

}
