//
//  DrawViewController.swift
//  drawAI
//
//  Created by João Guilherme on 20/10/21.
//

import UIKit

class DrawViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let canvas = CanvasView()
        canvas.setupDrawing()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
