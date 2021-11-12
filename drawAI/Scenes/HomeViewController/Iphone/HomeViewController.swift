//
//  HomeViewController.swift
//  drawAI
//
//  Created by Leonardo Viana on 20/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func didTouchStartButton(_ sender: Any) {
        let drawVC: DrawViewController = DrawViewController()
        
        navigationController?.pushViewController(drawVC, animated: true)
    }
}

extension HomeViewController {
    func setupUI() {
        view.backgroundColor = AppColors.backgroundColor
        
        startButton.backgroundColor = AppColors.primaryColor
        startButton.titleLabel?.textColor = AppColors.backgroundColor
        startButton.layer.cornerRadius = startButton.frame.height/2
        
        navigationController?.isNavigationBarHidden = true
    }
}
