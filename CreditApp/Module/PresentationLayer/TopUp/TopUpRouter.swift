//
//  TopUpRouter.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

protocol TopUpRouterDelegate: AnyObject {
    func set(navigator: Navigator)
    func pushToLoanConfirmation(phone: String, nominal: Int)
    func pushToPromo(model: PromoModel)
}

final class TopUpRouter: TopUpRouterDelegate {
    var navigator: Navigator?
    
    func set(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func pushToLoanConfirmation(phone: String, nominal: Int) {
        let vc = Assembler.sharedAssembler.resolver.resolve(LoanConfirmationViewControllerDelegate.self, arguments: phone, nominal)!
        navigator?.push(viewController: vc)
    }
    
    func pushToPromo(model: PromoModel) {
        let vc = Assembler.sharedAssembler.resolver.resolve(PromoViewControllerDelegate.self, argument: model)!
        navigator?.push(viewController: vc)
    }
}
