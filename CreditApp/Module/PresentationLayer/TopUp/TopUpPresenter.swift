//
//  TopUpPresenter.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

protocol TopUpPresenterDelegate: AnyObject {
    func set(vc: TopUpViewControllerDelegate)
    func pushToLoanConfirmation(phone: String, nominal: Int)
    func pushToPromo(model: PromoModel)
}

final class TopUpPresenter: TopUpPresenterDelegate {
    
    weak var vc: TopUpViewControllerDelegate?
    private let router: TopUpRouterDelegate
    
    init(router: TopUpRouterDelegate) {
        self.router = router
    }
    
    func set(vc: TopUpViewControllerDelegate) {
        self.vc = vc
    }
    
    func pushToLoanConfirmation(phone: String, nominal: Int) {
        router.pushToLoanConfirmation(phone: phone, nominal: nominal)
    }
    
    func pushToPromo(model: PromoModel) {
        router.pushToPromo(model: model)
    }
    
}

