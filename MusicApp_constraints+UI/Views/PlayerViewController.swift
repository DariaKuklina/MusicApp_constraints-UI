//
//  PlayerViewController.swift
//  MusicApp_constraints+UI
//
//  Created by Darja Dobrih on 08.02.2023.
//

import Foundation
import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var playPauseButton: PlayPauseButton!
    @IBOutlet weak var previosButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var coverContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleAppearance()
    }
    
    // MARK: - Private
    
    private func styleAppearance() {
        coverImageView.layer.cornerRadius = 10.0
    }
    
    // MARK: - Overrides
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent //light top
        
    }
    
    //MARK: - Actions
    
    @IBAction func playPauseButtonDidPress(sender: PlayPauseButton) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 10,
                       options: .curveEaseInOut,
                       animations: {
                        if self.playPauseButton.state == .highlighted {
                            self.coverContainer.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
                        } else {
                            self.coverContainer.transform = CGAffineTransform(scaleX: 1, y: 1)
                        }
        },
                       completion: nil)
        
        if playPauseButton.state == .highlighted {
            playPauseButton.isSelected = true
        } else {
            playPauseButton.isSelected = false
        }
    }
    
}
