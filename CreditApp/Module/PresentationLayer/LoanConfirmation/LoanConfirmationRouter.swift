//
//  LoanConfirmationRouter.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

protocol LoanConfirmationRouterDelegate: AnyObject {
    func set(navigator: Navigator)
    func pushToPaymentDetails(phone: String, nominal: Int)
}

final class LoanConfirmationRouter: LoanConfirmationRouterDelegate {
    var navigator: Navigator?
    
    func set(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func pushToPaymentDetails(phone: String, nominal: Int) {
        let vc = Assembler.sharedAssembler.resolver.resolve(PaymentDetailsViewControllerDelegate.self, arguments: phone, nominal)!
        navigator?.push(viewController: vc)
    }
    
}
