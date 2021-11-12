//
//  EndViewController.swift
//  drawAI
//
//  Created by João Guilherme on 22/10/21.
//

import UIKit
import Vision

class EndViewController: UIViewController {

    @IBOutlet private weak var userDrawImage: UIImageView!
    @IBOutlet private weak var referenceImage: UIImageView!
    @IBOutlet private weak var imageView: UIView!
    @IBOutlet private weak var scoreView: UIView!
    @IBOutlet private weak var userDraw: UIView!
    @IBOutlet private weak var homeButton: UIButton!
    @IBOutlet private weak var tryAgainButton: UIButton!
    @IBOutlet private weak var nextRoundView: UIView!
    @IBOutlet private weak var nextRoundLabel: UILabel!
    @IBOutlet private weak var scorePercentLabel: UILabel!
    @IBOutlet private weak var scoreValueLabel: UILabel!
    @IBOutlet private weak var nextRoundImageView: UIImageView!
    
    private let viewModel: EndViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIData()
        DispatchQueue.global(qos: .userInitiated).async {
            self.viewModel.processImages()
        }
    }
  
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.removeSavedImages()
    }

    @IBAction func didTouchTryAgain(_ sender: Any) {
        let drawVM: DrawViewModel = viewModel.buildDrawViewModel()
        
        let drawVC: DrawViewController = DrawViewController(viewModel: drawVM)
        
        navigationController?.pushViewController(drawVC, animated: true)
    }
    @IBAction func didTouchHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func didTouchNextRound(_ sender: UIButton) {
        let drawVC: DrawViewController = DrawViewController()
        
        navigationController?.pushViewController(drawVC, animated: true)
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
        
        referenceImage.contentMode = .scaleAspectFit
        referenceImage.layer.cornerRadius = imageView.frame.height * 0.275
        
        userDrawImage.contentMode = .scaleAspectFit
        userDrawImage.layer.cornerRadius = userDraw.frame.height * 0.08
    }
    
    func setupUIData() {
        userDrawImage.image = UIImage(contentsOfFile: viewModel.drawingImgUrl.path)
        referenceImage.image = UIImage(contentsOfFile: viewModel.referenceImgUrl.path)
        scoreValueLabel.text = viewModel.formattedScore
    }
}
