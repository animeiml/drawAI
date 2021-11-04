//
//  HomeIpadViewController.swift
//  drawAI
//
//  Created by João Guilherme on 29/10/21.
//

import UIKit

class HomeIpadViewController: UIViewController {
    //portrait
    @IBOutlet weak var drawAspectPortrait: NSLayoutConstraint!
    @IBOutlet weak var drawTopPortrait: NSLayoutConstraint!
    
    
    @IBOutlet weak var aiAspectPortrait: NSLayoutConstraint!
    @IBOutlet weak var aiTopPortrait: NSLayoutConstraint!
    
    @IBOutlet weak var bottomButtonPortrait: NSLayoutConstraint!
    
    
    @IBOutlet weak var logoHeigtPortrait: NSLayoutConstraint!
    @IBOutlet weak var topLogoPortrait: NSLayoutConstraint!
    @IBOutlet weak var logoAspectPortrait: NSLayoutConstraint!
    
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    //landscape
    @IBOutlet weak var logoTopLandscape: NSLayoutConstraint!
    @IBOutlet weak var logoAspectLandscape: NSLayoutConstraint!
    @IBOutlet weak var logoHeightLandscape: NSLayoutConstraint!
    
    
    @IBOutlet weak var drawAspectLandscape: NSLayoutConstraint!
    @IBOutlet weak var drawTopLandscape: NSLayoutConstraint!

    
    
    @IBOutlet weak var aiAspectLandscape: NSLayoutConstraint!
    @IBOutlet weak var aiTopLandscape: NSLayoutConstraint!
    
    
    @IBOutlet weak var startBottomLandscape: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.layer.cornerRadius = logoView.frame.width * 0.14
        startButton.layer.cornerRadius = startButton.frame.height/2
    

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        applyPortraitConstraints()
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
        drawTopPortrait.isActive = true
        drawAspectPortrait.isActive = true
        
        aiTopPortrait.isActive = true
        aiAspectPortrait.isActive = true

        
        bottomButtonPortrait.isActive = true
        
        logoHeigtPortrait.isActive = true
        topLogoPortrait.isActive = true
        logoAspectPortrait.isActive = true
        
        drawTopLandscape.isActive = false
        drawAspectLandscape.isActive = false
        
        aiTopLandscape.isActive = false
        aiAspectLandscape.isActive = false
        
        startBottomLandscape.isActive = false
        
        logoHeightLandscape.isActive = false
        logoTopLandscape.isActive = false
        logoAspectLandscape.isActive = false
        
        
    }
    
    func applyLandscapeConstraints(){
        drawTopPortrait.isActive = false
        drawAspectPortrait.isActive = false

        
        aiTopPortrait.isActive = false
        aiAspectPortrait.isActive = false
        
        bottomButtonPortrait.isActive = false
        
        logoHeigtPortrait.isActive = false
        topLogoPortrait.isActive = false
        logoAspectPortrait.isActive = false
        
        drawTopLandscape.isActive = true
        drawAspectLandscape.isActive = true
        
        aiTopLandscape.isActive = true
        aiAspectLandscape.isActive = true

        
        startBottomLandscape.isActive = true
        
        logoHeightLandscape.isActive = true
        logoTopLandscape.isActive = true
        logoAspectLandscape.isActive = true
        
        
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
