//
//  DrawTimerBarView.swift
//  drawAI
//
//  Created by Alessandro Negrão on 25/10/21.
//

import UIKit

protocol DrawTimerBarDelegate: AnyObject {
  func startTimer()
}

class DrawTimerBarView: ANView {
    
    private var timerValue: Double = 1.0
    
    var progress: CGFloat = 1.0 {
        didSet { setNeedsDisplay() }
    }
    private var progressLayer = CAShapeLayer()
    var color: UIColor = .blue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(progressLayer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.addSublayer(progressLayer)
    }
    
    override func draw(_ rect: CGRect) {
        let backgroundMask: CAShapeLayer = CAShapeLayer()
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.4).cgPath
        layer.mask = backgroundMask
        
        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
        progressLayer.frame = progressRect
        progressLayer.backgroundColor = color.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func startTimer(progressBar: DrawTimerBarView){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){
            _ in
            if self.timerValue > 0 {
                self.timerValue -= 0.01
                progressBar.progress = self.timerValue
            }
        }
    }
}
