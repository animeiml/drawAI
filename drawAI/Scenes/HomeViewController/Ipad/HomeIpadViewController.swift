//
//  HomeIpadViewController.swift
//  drawAI
//
//  Created by João Guilherme on 29/10/21.
//

import UIKit

class HomeIpadViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
        
        startButton.backgroundColor = AppColors.primaryColor
        startButton.titleLabel?.textColor = AppColors.backgroundColor
        startButton.layer.cornerRadius = startButton.frame.height/2
    }
    
    @IBAction func didTouchStart(_ sender: Any) {
        let drawViewC: iPadDrawViewController = iPadDrawViewController()
        self.navigationController?.pushViewController(drawViewC, animated: true)
    }
}
