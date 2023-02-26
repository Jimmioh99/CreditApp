//
//  LoanConfirmationPresenter.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

protocol LoanConfirmationPresenterDelegate: AnyObject {
    func set(vc: LoanConfirmationViewControllerDelegate)
    func pushToPaymentDetails(phone: String, nominal: Int)
}

final class LoanConfirmationPresenter: LoanConfirmationPresenterDelegate {
    
    weak var vc: LoanConfirmationViewControllerDelegate?
    private let router: LoanConfirmationRouterDelegate
    
    init(router: LoanConfirmationRouterDelegate) {
        self.router = router
    }
    
    func set(vc: LoanConfirmationViewControllerDelegate) {
        self.vc = vc
    }
    
    func pushToPaymentDetails(phone: String, nominal: Int) {
        router.pushToPaymentDetails(phone: phone, nominal: nominal)
    }
    
}

