//
//  FinishedViewController.swift
//  drawAI
//
//  Created by João Guilherme on 26/10/21.
//

import UIKit

class FinishedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigate()
    }
}

extension FinishedViewController {
    private func setupUI() {
        view.backgroundColor = AppColors.backgroundColor
    }
    
    private func navigate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            let endVC: EndViewController = EndViewController(viewModel: EndViewModel())
            
            self.navigationController?.pushViewController(endVC, animated: true)
        }
    }
}
