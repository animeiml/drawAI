//
//  FinishedViewController.swift
//  drawAI
//
//  Created by João Guilherme on 26/10/21.
//

import UIKit

class FinishedViewController: UIViewController {

    @IBOutlet weak var mascotImageView: UIImageView!
    @IBOutlet weak var mascotView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension FinishedViewController {
    private func setupUI() {
        view.backgroundColor = AppColors.backgroundColor
        
        mascotView.layer.cornerRadius = mascotView.frame.width * 0.0866
        mascotImageView.contentMode = .scaleAspectFit
    }
}
