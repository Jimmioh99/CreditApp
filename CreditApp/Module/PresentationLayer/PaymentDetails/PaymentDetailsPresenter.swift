//
//  PaymentDetailsPresenter.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

protocol PaymentDetailsPresenterDelegate: AnyObject {
    func set(vc: PaymentDetailsViewControllerDelegate)
}

final class PaymentDetailsPresenter: PaymentDetailsPresenterDelegate {
    
    weak var vc: PaymentDetailsViewControllerDelegate?
    private let router: PaymentDetailsRouterDelegate
    
    init(router: PaymentDetailsRouterDelegate) {
        self.router = router
    }
    
    func set(vc: PaymentDetailsViewControllerDelegate) {
        self.vc = vc
    }
    
}

