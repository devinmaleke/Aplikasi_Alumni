//
//  Extensions.swift
//  Aplikasi Alumni
//
//  Created by Cyberindo Sinergi Sistem on 02/06/24.
//

import UIKit

enum PoppinsFontType: String {
    case semiBold = "Poppins-SemiBold"
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
}

extension UILabel {
    func setFont(type: PoppinsFontType, size: CGFloat) {
        self.font = UIFont(name: type.rawValue, size: size)
    }
}

extension UIFont {
    static func poppinsFont(type: PoppinsFontType, size: CGFloat) -> UIFont? {
        return UIFont(name: type.rawValue, size: size)
    }
}

extension UIButton {
    func setAttributedTitle(_ title: String, poppinsFont type: PoppinsFontType, size: CGFloat, color: UIColor, for state: UIControl.State) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size),
            .foregroundColor: color
        ]
        let attributedText = NSAttributedString(string: title, attributes: attributes)
        self.setAttributedTitle(attributedText, for: state)
    }
}

extension UIView{
    func shadowUIView(offset:CGSize, opacity:Float, radius:CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func presentRightLeft(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = .none
        transition.type = .push
        transition.subtype = CATransitionSubtype.fromRight
        self.window!.layer.add(transition, forKey: nil)
    }
    func dismissLeftRight(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = .none
        transition.type = .reveal
        transition.subtype = CATransitionSubtype.fromLeft
        self.window!.layer.add(transition, forKey: nil)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
}


extension UIColor {
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = hexString.index(after: hexString.startIndex)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension Date{
    func asEpochToString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension String? {
    var isNilOrEmpty:Bool{
        return self==nil || self==""
    }
}

extension UISearchBar {

    func customizeSearchBar(backgroundColor: UIColor, textColor: UIColor, placeholderColor: UIColor, font: UIFont) {
        // Change background color
        self.barTintColor = backgroundColor
        self.searchTextField.backgroundColor = backgroundColor
        
        // Change text field font and text color
        if let textField = self.value(forKey: "searchField") as? UITextField {
            textField.textColor = textColor
            textField.font = font
            
            // Change placeholder color
            if let placeholderLabel = textField.value(forKey: "placeholderLabel") as? UILabel {
                placeholderLabel.textColor = placeholderColor
            }
        }
        
        // Change cancel button color
        if let cancelButton = self.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitleColor(textColor, for: .normal)
        }
    }
}
