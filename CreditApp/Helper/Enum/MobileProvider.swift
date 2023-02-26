//
//  MobileProvider.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit

struct MobileProvider {
    
    var number: String
    
    enum MobileProviderType {
        case telkomsel
        case indosat
        case tri
        case XL
        case axis
        case smartfren
        case noProvider
    }
    
    var phoneImage: UIImage? {
        switch provider {
            case .telkomsel:
                return UIImage(named: "ic_telkomsel")
            case .indosat:
                return UIImage(named: "ic_indosat")
            case .tri:
                return UIImage(named: "ic_tri")
            case .XL:
                return UIImage(named: "ic_xl")
            case .axis:
                return UIImage(named: "ic_axis")
            case .smartfren:
                return UIImage(named: "ic_smartfren")
            case .noProvider:
                return UIImage(named: "ic_null")
        }
    }
    
    var provider: MobileProviderType {
        guard number.count >= 4 else { return .noProvider }
        let index = number.index(number.startIndex, offsetBy: 4)
        let mySubstring = number[..<index]
        switch mySubstring {
        case "0852", "0853", "0811", "0812", "0813", "0821", "0851": // TELKOMSEL
            return .telkomsel
        case "0856", "0857": // INDOSAT
            return .indosat
        case "0896", "0895", "0897", "0898", "0899": // TRI
            return .tri
        case "0817", "0818", "0819", "0859", "0877", "0878": // XL
            return .XL
        case "0832", "0833", "0838": // AXIS
            return .axis
        case "0881", "0882", "0883", "0884", "0885", "0886", "0887", "0888", "0889": // SMARTFREN
            return .smartfren
        default:
            return .noProvider
        }
    }
}
