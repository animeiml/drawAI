//
//  IpadEndViewController.swift
//  drawAI
//
//  Created by João Guilherme on 04/11/21.
//

import UIKit

class IpadEndViewController: UIViewController {
    @IBOutlet private weak var userDrawImage: UIImageView!
    @IBOutlet private weak var referenceImage: UIImageView!
    @IBOutlet private weak var imageView: UIView!
    @IBOutlet private weak var scoreView: UIView!
    @IBOutlet private weak var userDraw: UIView!
    @IBOutlet private weak var homeButton: UIButton!
    @IBOutlet private weak var tryAgainButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var niceDrawLabel: UILabel!
    @IBOutlet private weak var scoreValueLabel: UILabel!
    
    //constraints
    
    //portrait
    @IBOutlet weak var leadingNicePortrait: NSLayoutConstraint!
    @IBOutlet weak var trailingNicePortait: NSLayoutConstraint!
    
    @IBOutlet weak var centerNextPortrait: NSLayoutConstraint!
    @IBOutlet weak var bottomNextPortrait: NSLayoutConstraint!
    
    @IBOutlet weak var leadingReferencePortrait: NSLayoutConstraint!
    
    @IBOutlet weak var centerHomePortrait: NSLayoutConstraint!
    @IBOutlet weak var topHomePortrait: NSLayoutConstraint!
    
    @IBOutlet weak var centerTryPortrait: NSLayoutConstraint!
    
    //Landscape
    
    @IBOutlet weak var trailingHomeLandscape: NSLayoutConstraint!
    
    @IBOutlet weak var centerNiceLandscape: NSLayoutConstraint!
    
    @IBOutlet weak var leadingReferenceLandscape: NSLayoutConstraint!
    
    @IBOutlet weak var centerTryLandscape: NSLayoutConstraint!
    @IBOutlet weak var centerXTryLandscape: NSLayoutConstraint!
    
    @IBOutlet weak var centerNextLandscape: NSLayoutConstraint!
    @IBOutlet weak var topNextLandscape: NSLayoutConstraint!
    
    private let viewModel: EndViewModel
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        applyOrientationConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        applyOrientationConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        setupUIData()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    init(viewModel: EndViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    @IBAction func didTouchHomeButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func didTouchTryButton(_ sender: Any) {
        let drawVM: DrawViewModel = viewModel.buildDrawViewModel()
        
        let drawVC: iPadDrawViewController = iPadDrawViewController(viewModel: drawVM)
        
        navigationController?.pushViewController(drawVC, animated: true)
    }
    
    @IBAction func didTouchNextButton(_ sender: Any) {
        let drawVC: iPadDrawViewController = iPadDrawViewController()
        
        navigationController?.pushViewController(drawVC, animated: true)
    }
}

extension IpadEndViewController{
    func setupUI() {
        view.backgroundColor = AppColors.backgroundColor
        
        userDraw.layer.cornerRadius = userDraw.frame.height * 0.08
        homeButton.layer.cornerRadius = homeButton.frame.height / 2
        tryAgainButton.layer.cornerRadius = tryAgainButton.frame.height / 2
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        
        niceDrawLabel.textColor = AppColors.primaryColor
        
        homeButton.backgroundColor = AppColors.primaryColor
        homeButton.titleLabel?.textColor = AppColors.backgroundColor
        
        tryAgainButton.backgroundColor = AppColors.primaryColor
        tryAgainButton.setTitleColor(AppColors.backgroundColor, for: .normal)
        
        nextButton.configuration?.imagePadding = nextButton.frame.width * 0.15
        nextButton.backgroundColor = AppColors.accentColor
        nextButton.titleLabel?.textColor = .black
        
        scoreView.backgroundColor = AppColors.primaryColor.withAlphaComponent(0.15)
        scoreView.layer.borderColor = AppColors.primaryColor.withAlphaComponent(0.2).cgColor
        scoreView.layer.borderWidth = 1.43
        scoreView.layer.cornerRadius = scoreView.frame.width / 2
        
        imageView.layer.cornerRadius = userDraw.frame.height * 0.08
        imageView.layer.borderColor = AppColors.primaryColor.cgColor
        imageView.layer.borderWidth = 1.43
        
        referenceImage.contentMode = .scaleAspectFill
        referenceImage.layer.cornerRadius = userDraw.frame.height * 0.08
        
        userDraw.layer.borderColor = AppColors.primaryColor.cgColor
        userDraw.layer.borderWidth = 1.43
        
        userDrawImage.contentMode = .scaleAspectFit
        userDrawImage.layer.cornerRadius = userDraw.frame.height * 0.08
    }
    
    func setupUIData() {
        referenceImage.image = UIImage(contentsOfFile: viewModel.referenceImgUrl.path)
        userDrawImage.image = UIImage(contentsOfFile: viewModel.drawingImgUrl.path)
        scoreValueLabel.text = viewModel.formattedScore
    }
    
    private func applyOrientationConstraints() {
        if UIDevice.current.orientation.isPortrait {
            applyPortraitDynamicConstraints()
        } else if UIDevice.current.orientation.isLandscape {
            applyLandscapeDynamicConstraints()
        }
    }
    
    private func applyPortraitDynamicConstraints() {
        NSLayoutConstraint.activate([
            leadingNicePortrait,
            trailingNicePortait,
            centerNextPortrait,
            bottomNextPortrait,
            leadingReferencePortrait,
            centerHomePortrait,
            topHomePortrait,
            centerTryPortrait
        ])
        
        NSLayoutConstraint.deactivate([
            trailingHomeLandscape,
            centerNiceLandscape,
            leadingReferenceLandscape,
            centerTryLandscape,
            centerXTryLandscape,
            centerNextLandscape,
            topNextLandscape,
        ])
    }
    
    private func applyLandscapeDynamicConstraints() {
        NSLayoutConstraint.deactivate([
            leadingNicePortrait,
            trailingNicePortait,
            centerNextPortrait,
            bottomNextPortrait,
            leadingReferencePortrait,
            centerHomePortrait,
            topHomePortrait,
            centerTryPortrait
        ])

        NSLayoutConstraint.activate([
            trailingHomeLandscape,
            centerNiceLandscape,
            leadingReferenceLandscape,
            centerTryLandscape,
            centerXTryLandscape,
            centerNextLandscape,
            topNextLandscape,
        ])
    }
}
