//
//  NavigationType.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Foundation
import UIKit

enum NavigationType {
    case dismiss
    case pop
}

struct Navigation {
    let type: NavigationType
    
    var image: UIImage? {
        switch type {
        case .dismiss:
            return UIImage(named: "ic_close")
        case .pop:
            return UIImage(named: "ic_back")
        }
    }
}
