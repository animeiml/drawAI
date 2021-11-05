//
//  EndViewController.swift
//  drawAI
//
//  Created by João Guilherme on 22/10/21.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var userDrawImage: UIImageView!
    @IBOutlet weak var referenceImage: UIImageView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var userDraw: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var nextRoundView: UIView!
    @IBOutlet weak var nextRoundLabel: UILabel!
    @IBOutlet weak var scorePercentLabel: UILabel!
    @IBOutlet weak var nextRoundImageView: UIImageView!
    
    private let viewModel: EndViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIData()
    }

    @IBAction func didTouchHome(_ sender: Any) {
       let homeViewC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        self.navigationController?.pushViewController(homeViewC, animated: true)
    }
    
    @IBAction func didTouchNextRound(_ sender: UIButton) {
        // TODO: Go to next round
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(viewModel: EndViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
}

extension EndViewController {
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = AppColors.backgroundColor
        
        userDraw.backgroundColor = AppColors.backgroundColor
        userDraw.layer.cornerRadius = userDraw.frame.height * 0.08
        userDraw.layer.borderColor = AppColors.primaryColor.cgColor
        userDraw.layer.borderWidth = 1

        homeButton.backgroundColor = AppColors.primaryColor
        homeButton.titleLabel?.textColor = AppColors.backgroundColor
        homeButton.layer.cornerRadius = homeButton.frame.height / 2
        
        tryAgainButton.backgroundColor = AppColors.primaryColor
        tryAgainButton.setTitleColor(AppColors.backgroundColor, for: .normal)
        tryAgainButton.layer.cornerRadius = tryAgainButton.frame.height / 2
        
        nextRoundView.backgroundColor = AppColors.accentColor
        nextRoundView.layer.cornerRadius = nextRoundView.frame.height/2
        nextRoundView.layer.masksToBounds = true
        nextRoundLabel.textColor = AppColors.iconColor
        
        scoreView.layer.borderColor = AppColors.primaryColor.cgColor
        scoreView.layer.borderWidth = 1
        scoreView.layer.cornerRadius = scoreView.frame.width / 2
        scoreView.backgroundColor = AppColors.primaryColor.withAlphaComponent(0.2)
        
        scorePercentLabel.textColor = AppColors.primaryColor
        
        imageView.layer.cornerRadius = imageView.frame.height * 0.275
        imageView.layer.borderColor = AppColors.primaryColor.cgColor
        imageView.layer.borderWidth = 1
        imageView.backgroundColor = AppColors.backgroundColor
        
        referenceImage.image = UIImage(named: "kakashi")
        referenceImage.contentMode = .scaleAspectFit
        referenceImage.layer.cornerRadius = imageView.frame.height * 0.275
        
        userDrawImage.contentMode = .scaleAspectFit
        userDrawImage.layer.cornerRadius = userDraw.frame.height * 0.08
    }
    
    func setupUIData() {
        userDrawImage.image = UIImage(contentsOfFile: viewModel.drawingImgUrl.path)
    }
}
