//
//  FirstScreen.swift
//  firstProject
//
//  Created by Oskar Biwejnis on 03/07/2023.
//

import UIKit

protocol WorkerDelegate: AnyObject {
    func didFinishWork()
}

class FirstScreen: UIViewController, WorkerDelegate {
    func didFinishWork() {
        <#code#>
    }
    
    
    var label2: UILabel!
    var button2: UIButton!
    var textField2: UITextField!
    var buttonToSecondScreen: UIButton!
    
    class Worker {
        weak var delegate: WorkerDelegate?
        
        func startWork() {
            delegate?.didFinishWork()
        }
    }
    
    private let worker = Worker()
    
    
    
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "LABEL"
        view.addSubview(label2)
        
        textField2 = UITextField()
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2.textAlignment = .center
        textField2.text = "TEXT FIELD"
        textField2.isUserInteractionEnabled = true
        view.addSubview(textField2)
        
        button2 = UIButton(type: .system)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("BUTTON", for: .normal)
        button2.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button2)
        
        buttonToSecondScreen = UIButton(type: .system)
        buttonToSecondScreen.translatesAutoresizingMaskIntoConstraints = false
        buttonToSecondScreen.setTitle("NEXT SCREEN", for: .normal)
        buttonToSecondScreen.addTarget(self, action: #selector(buttonToSecondScreenTapped), for: .touchUpInside)
        view.addSubview(buttonToSecondScreen)

        
        
        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 0),
            label2.bottomAnchor.constraint(equalTo: textField2.topAnchor, constant: -100),
            
            textField2.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 0),
            textField2.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: 0),
            
            button2.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 0),
            button2.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 50),
            
            buttonToSecondScreen.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor, constant: 0),
            buttonToSecondScreen.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 50)

        ])
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worker.delegate = self
        
        worker.startWork()
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        label2.text = textField2.text
    }
    
    @objc func buttonToSecondScreenTapped(_ sender: UIButton) {
        let secondScreen = SecondScreen()
        navigationController?.pushViewController(secondScreen, animated: false)
    }

    /*@IBOutlet weak var button1: UIButton!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var label1: UILabel!
    
    @IBAction func onButton(_ sender: UIButton) {
        label1.text = textField1.text
    }
    */
    
    
    
    
    
    
}

