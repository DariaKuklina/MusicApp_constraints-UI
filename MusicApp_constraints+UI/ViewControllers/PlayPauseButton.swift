//
//  PlayPauseButton.swift
//  MusicApp_constraints+UI
//
//  Created by Darja Dobrih on 08.02.2023.
//

import UIKit

class PlayPauseButton: UIButton {
    override var isSelected: Bool {
        didSet {
            self.animate(for: isSelected)
        }
        
    }
    
    private func animate(for selection: Bool) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseInOut,
                       animations: {
                        if selection {
                            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                        } else {
                            self.transform = CGAffineTransform(scaleX: 1, y: 1)
                        }
        },
                       completion: nil)
    }
}

