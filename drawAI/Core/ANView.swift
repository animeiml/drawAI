//
//  ANView.swift
//  drawAI
//
//  Created by Leonardo Viana on 21/10/21.
//

import Foundation
import UIKit

open class ANView: UIView {
    
    //*************************************************
    // MARK: - Private Properties
    //*************************************************
    
    open var frameworkBundle: Bundle {
        return Bundle.main
    }
    
    private var contentView: UIView
    
    //*************************************************
    // MARK: - Public Properties
    //*************************************************

    public override var backgroundColor: UIColor? {
        didSet {
            contentView.backgroundColor = backgroundColor
        }
    }
    
    //*************************************************
    // MARK: - Inits
    //*************************************************
    
    public override init(frame: CGRect) {
        self.contentView = UIView()
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.contentView = UIView()
        super.init(coder: aDecoder)
        setup()
    }
}

//*************************************************
// MARK: - Private Methods
//*************************************************

extension ANView {
    private func setup() {
        guard type(of: self) != type(of: ANView.self) else {
            debugPrint("You must subclass ANView. Don't use it directly.")
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        let className = String(describing: type(of: self))
        
        if let xibView: UIView = frameworkBundle.loadNibNamed(className, owner: self, options: nil)!.first as? UIView {
            contentView = xibView
        }
        
        contentView.frame = self.bounds
        addSubview(contentView)
        contentView.pinEdges(to: self)
    }
}
