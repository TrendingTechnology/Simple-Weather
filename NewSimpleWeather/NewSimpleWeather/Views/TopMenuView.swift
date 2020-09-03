//
//  TopMenuView.swift
//  NewSimpleWeather
//
//  Created by Júlia Yamamoto on 27/08/20.
//  Copyright © 2020 Júlia Yamamoto. All rights reserved.
//

import UIKit

class TopMenuView: UIView {
    
    
    // MARK: - Constraints
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var traillingConstraint: NSLayoutConstraint?
    
    
    // MARK: - Methods

    func openMenu(animationTime: Double = 0.3, onView: UIView? = nil, animationFinished: @escaping() -> Void?){
        guard let topConstraint = self.topConstraint else { return }
        guard let leadingConstraint = self.leadingConstraint else { return }
        guard let traillingConstraint = self.traillingConstraint else { return }
        
        topConstraint.constant = 0
        leadingConstraint.constant = 0
        traillingConstraint.constant = 0
        
        UIView.animate(withDuration: animationTime, delay: 0, options: [], animations: {
            onView?.layoutIfNeeded()
        }) { (_) in
            animationFinished()
        }
    }
    
    func closeMenu(animationTime: Double = 0.3, onView: UIView? = nil, animationFinished: @escaping() -> Void?){
        guard let topConstraint = self.topConstraint else { return }
        guard let leadingConstraint = self.leadingConstraint else { return }
        guard let traillingConstraint = self.traillingConstraint else { return }
        
        let screenWidth = UIScreen.main.bounds.size.width
        topConstraint.constant = -135
        leadingConstraint.constant = screenWidth - 72
        traillingConstraint.constant = screenWidth + 72
        
        UIView.animate(withDuration: animationTime, delay: 0, options: [], animations: {
            onView?.layoutIfNeeded()
        }) { (_) in
            animationFinished()
        }
    }
}
