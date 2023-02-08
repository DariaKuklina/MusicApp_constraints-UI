//
//  UIView+Shadow.swift
//  MusicApp_constraints+UI
//
//  Created by Darja Dobrih on 08.02.2023.
//

import UIKit
import QuartzCore

private struct Constants {
    
    struct Values {
        static let shadowRadius: CGFloat = 5
        static let shadowUnactiveRadius: CGFloat = 12
        static let shadowOpacity: Float = 0.7
        static let shadowUnactiveOpacity: Float = 0.1
        static let shadowOffsetForTopSmallStyle = CGSize(width: 0, height: -1)
        static let shadowOffsetForBottomSmalStyle = CGSize(width: 0, height: 2)
        static let shadowOffsetForActiveButtonStyle = CGSize(width: 0, height: 7)
        static let shadowOffsetForButtonCellStyle = CGSize(width: 0, height: 4)
    }
    
    struct Colors {
        static let defaultBlackColor: UIColor = UIColor.black.withAlphaComponent(0.5)
    }
}

extension UIView {
    enum ShadowStyle {
        case none
        case bottom
        case bottomActiveButton
        case top
        case inactive
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            layer.masksToBounds = false
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    func addShadow(style: ShadowStyle) {
        addShadow(style: style, color: Constants.Colors.defaultBlackColor)
    }
    
    func addShadow(style: ShadowStyle, color: UIColor) {
        addShadow(style: style, color: color, radius: Constants.Values.shadowRadius, opacity: Constants.Values.shadowOpacity)
    }
    
    func addShadow(style: ShadowStyle, color: UIColor, radius: CGFloat, opacity: Float) {
        self.layer.shadowPath = nil
        self.layer.shadowOpacity = 0
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        
        switch style {
        case .none:
            return
        case .top:
            layer.shadowOffset = Constants.Values.shadowOffsetForTopSmallStyle
        case .bottom:
            layer.shadowOffset = Constants.Values.shadowOffsetForBottomSmalStyle
        case .inactive:
            layer.shadowRadius = Constants.Values.shadowUnactiveRadius
            layer.shadowOpacity = Constants.Values.shadowUnactiveOpacity
            layer.shadowOffset = Constants.Values.shadowOffsetForButtonCellStyle
        case .bottomActiveButton:
            layer.shadowOffset = Constants.Values.shadowOffsetForActiveButtonStyle
        }
        layer.masksToBounds = false
    }
}

extension UIView {
    
    private struct ConfigConstants {
        static let shadowRadius: CGFloat = 5
        static let shadowOpacity: Float = 0.1
        static let greenShadowRadius: CGFloat = 4
        static let greenShadowOpacity: Float = 0.3
    }
    
    func addShadow() {
        addShadow(style: .bottom, color: .black, radius: ConfigConstants.shadowRadius, opacity: ConfigConstants.shadowOpacity)
    }
    
   
}
