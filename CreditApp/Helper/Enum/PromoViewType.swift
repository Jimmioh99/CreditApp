//
//  PromoViewType.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit

enum PromoViewType {
    case image
    case headTitle
    case subTitle
    case description
    case voucherCode
    case listDescription
    
    var fontSize: UIFont {
        switch self {
        case .headTitle:
            return UIFont.boldSystemFont(ofSize: 18)
        default:
            return UIFont.systemFont(ofSize: 14)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .subTitle:
            return UIColor.lightGray
        case .description:
            return UIColor.darkGray
        default:
            return .black
        }
    }
}
