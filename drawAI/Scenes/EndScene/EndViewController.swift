//
//  EndViewController.swift
//  drawAI
//
//  Created by João Guilherme on 22/10/21.
//

import UIKit
import Vision

class EndViewController: UIViewController {

    @IBOutlet weak var userDrawImage: UIImageView!
    @IBOutlet weak var referenceImage: UIImageView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var userDraw: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
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

    @IBAction func didTouchHome(_ sender: Any) {
       let homeViewC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        self.navigationController?.pushViewController(homeViewC, animated: true)
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
        userDraw.layer.cornerRadius = userDraw.frame.height * 0.08
        homeButton.layer.cornerRadius = homeButton.frame.height / 2
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        
        var config = UIButton.Configuration.filled()
        config.imagePlacement = .trailing
        config.imagePadding = 5
        
        nextButton.configuration?.imagePadding = nextButton.frame.width * 0.4391
        
        scoreView.layer.borderColor = UIColor(red: 0.00, green: 0.48, blue: 1.00, alpha: 0.20).cgColor
        scoreView.layer.borderWidth = 1
        scoreView.layer.cornerRadius = scoreView.frame.width / 2
        
        imageView.layer.cornerRadius = imageView.frame.height * 0.275
        imageView.layer.borderColor = UIColor(red: 0.00, green: 0.48, blue: 1.00, alpha: 0.20).cgColor
        imageView.layer.borderWidth = 1
        
        referenceImage.contentMode = .scaleAspectFit
        referenceImage.layer.cornerRadius = imageView.frame.height * 0.275
        
        userDrawImage.contentMode = .scaleAspectFit
        userDrawImage.layer.cornerRadius = userDraw.frame.height * 0.08
    }
    
    func setupUIData() {
        userDrawImage.image = UIImage(contentsOfFile: viewModel.drawingImgUrl.path)
        referenceImage.image = UIImage(contentsOfFile: viewModel.referenceImgUrl.path)
    }
}
