//
//  IpadFinishedViewController.swift
//  drawAI
//
//  Created by João Guilherme on 04/11/21.
//

import UIKit

class IpadFinishedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigate()
    }
    
   
}

extension IpadFinishedViewController{
    private func setupUI(){
        view.backgroundColor = AppColors.backgroundColor
    }
    private func navigate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            
            let endVC: IpadEndViewController = IpadEndViewController(viewModel: EndViewModel())
            
            self.navigationController?.pushViewController(endVC, animated: true)
        }
    }
}
