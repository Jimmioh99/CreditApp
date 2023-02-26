//
//  PromoRouter.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

protocol PromoRouterDelegate: AnyObject {
    func set(navigator: Navigator)
}

final class PromoRouter: PromoRouterDelegate {
    var navigator: Navigator?
    
    func set(navigator: Navigator) {
        self.navigator = navigator
    }
}
