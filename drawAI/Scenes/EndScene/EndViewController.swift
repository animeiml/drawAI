//
//  EndViewController.swift
//  drawAI
//
//  Created by João Guilherme on 22/10/21.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var userDraw: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userDraw.layer.cornerRadius = 22
        homeButton.layer.cornerRadius = 23
        saveButton.layer.cornerRadius = 23
        nextButton.layer.cornerRadius = 23
        
        scoreView.layer.borderColor = UIColor(red: 0.00, green: 0.48, blue: 1.00, alpha: 0.20).cgColor
        scoreView.layer.borderWidth = 1
        scoreView.layer.cornerRadius = scoreView.frame.width / 2
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
