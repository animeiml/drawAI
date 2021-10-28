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
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userDraw.layer.cornerRadius = userDraw.frame.height * 0.08
        homeButton.layer.cornerRadius = homeButton.frame.height / 2
        saveButton.layer.cornerRadius = saveButton.frame.height / 2
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        
        var config = UIButton.Configuration.filled()
        config.imagePlacement = .trailing
        config.imagePadding = 5
        
        nextButton.configuration?.imagePadding = nextButton.frame.width * 0.4391
        
        scoreView.backgroundColor = Colors.redButtonColor.withAlphaComponent(0.15)
        scoreView.layer.borderColor = Colors.redButtonColor.withAlphaComponent(0.20).cgColor
        scoreView.layer.borderWidth = 1
        scoreView.layer.cornerRadius = scoreView.frame.width / 2
        
        imageView.layer.cornerRadius = imageView.frame.height * 0.275
        imageView.layer.borderColor = Colors.redButtonColor.cgColor
        imageView.layer.borderWidth = 1
        
        referenceImage.image = UIImage(named: "kakashi")
        referenceImage.contentMode = .scaleAspectFit
        referenceImage.layer.cornerRadius = imageView.frame.height * 0.275
        
        userDraw.layer.borderColor = Colors.redButtonColor.cgColor
        userDraw.layer.borderWidth = 1
        
        userDrawImage.contentMode = .scaleAspectFit
        userDrawImage.layer.cornerRadius = userDraw.frame.height * 0.08
    }

    @IBAction func didTouchHome(_ sender: Any) {
       let homeViewC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        self.navigationController?.pushViewController(homeViewC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
