//
//  ViewController.swift
//  firstProject
//
//  Created by Oskar Biwejnis on 03/07/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var label1: UILabel!
    
    @IBAction func onButton(_ sender: UIButton) {
        
        
        label1.text = textField1.text
    }
}

