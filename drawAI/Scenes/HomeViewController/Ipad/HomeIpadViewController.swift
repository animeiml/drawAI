//
//  HomeIpadViewController.swift
//  drawAI
//
//  Created by João Guilherme on 29/10/21.
//

import UIKit

class HomeIpadViewController: UIViewController {
    //portrait
  

    @IBOutlet weak var bottomButtonPortrait: NSLayoutConstraint!
 
    @IBOutlet weak var logoTopPortrait: NSLayoutConstraint!
    
    @IBOutlet weak var startButton: UIButton!
    
    //landscape
  
    
    @IBOutlet weak var startBottomLandscape: NSLayoutConstraint!
    
    @IBOutlet weak var logoTopLandscape: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = AppColors.backgroundColor
        
        startButton.backgroundColor = AppColors.primaryColor
        startButton.titleLabel?.textColor = AppColors.backgroundColor
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

        bottomButtonPortrait.isActive = true
        logoTopPortrait.isActive = true
        
        startBottomLandscape.isActive = false
        logoTopLandscape.isActive = false
   
    }
    
    func applyLandscapeConstraints(){
    
        bottomButtonPortrait.isActive = false
        logoTopPortrait.isActive = false
       
        startBottomLandscape.isActive = true
        logoTopLandscape.isActive = true
        
        
    }

    @IBAction func didTouchStart(_ sender: Any) {
        let drawViewC: iPadDrawViewController = iPadDrawViewController()
         self.navigationController?.pushViewController(drawViewC, animated: true)
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
