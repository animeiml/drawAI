//
//  IpadFinishedViewController.swift
//  drawAI
//
//  Created by João Guilherme on 04/11/21.
//

import UIKit

class IpadFinishedViewController: UIViewController {

    @IBOutlet weak var mascotView: UIView!
    @IBOutlet weak var mascotImageView: UIImageView!
    
    @IBOutlet weak var mascotViewWidthLandscape: NSLayoutConstraint!
    @IBOutlet weak var mascotViewAspectLandscape: NSLayoutConstraint!
    
    
    @IBOutlet weak var mascotViewHeightPortrait: NSLayoutConstraint!
    @IBOutlet weak var mascotViewAspectPortrait: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mascotView.layer.cornerRadius = mascotView.frame.width * 0.0866
        
        mascotImageView.contentMode = .scaleAspectFit
        mascotView.layer.cornerRadius = mascotView.frame.width * 0.0866
        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let orient = UIDevice.current.orientation

                switch orient {
                case .portrait:
                    print("Portrait")
                    self.applyPortraitConstraints()
                    break
                    // Do something
                default:
                    print("LandScape")
                    // Do something else
                    self.applyLandscapeConstraints()
                    break
                }
    }
    
    func applyPortraitConstraints(){
        mascotViewAspectPortrait.isActive = true
        mascotViewHeightPortrait.isActive = true
        
        mascotViewWidthLandscape.isActive = false
        mascotViewAspectLandscape.isActive = false
    }
    
    func applyLandscapeConstraints(){
        mascotViewAspectPortrait.isActive = false
        mascotViewHeightPortrait.isActive = false
        
        mascotViewWidthLandscape.isActive = true
        mascotViewAspectLandscape.isActive = true
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
