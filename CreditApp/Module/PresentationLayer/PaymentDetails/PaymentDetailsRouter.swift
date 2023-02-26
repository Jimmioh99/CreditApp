//
//  PaymentDetailsRouter.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

protocol PaymentDetailsRouterDelegate: AnyObject {
    func set(navigator: Navigator)
}

final class PaymentDetailsRouter: PaymentDetailsRouterDelegate {
    var navigator: Navigator?
    
    func set(navigator: Navigator) {
        self.navigator = navigator
    }
}
