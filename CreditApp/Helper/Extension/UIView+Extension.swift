//
//  UIView+Extension.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit

extension UIView {
    public func setupSubviews(_ views: [UIView]) {
        for item in views {
            addSubview(item)
        }
    }
    
    public func setCornerRadiusWithShadow(cornerRadius: CGFloat = 10, shadowColor: CGColor = UIColor.gray.cgColor) {
        // To round the corners
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        // To provide the shadow
        self.layer.shadowRadius = cornerRadius
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = shadowColor
        self.layer.masksToBounds = false
    }
}
