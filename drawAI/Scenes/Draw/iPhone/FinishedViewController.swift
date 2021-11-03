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

        mascotView.layer.cornerRadius = mascotView.frame.width * 0.0866
        
        mascotImageView.contentMode = .scaleAspectFit
        mascotView.layer.cornerRadius = mascotView.frame.width * 0.0866
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
