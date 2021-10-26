//
//  HomeViewController.swift
//  drawAI
//
//  Created by Leonardo Viana on 20/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var logoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = startButton.frame.height/2
        
        logoView.layer.cornerRadius = logoView.frame.height * 0.14
    }
}
