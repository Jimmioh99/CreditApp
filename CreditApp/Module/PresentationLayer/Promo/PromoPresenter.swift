//
//  PromoPresenter.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

protocol PromoPresenterDelegate: AnyObject {
    func set(vc: PromoViewControllerDelegate)
}

final class PromoPresenter: PromoPresenterDelegate {
    
    weak var vc: PromoViewControllerDelegate?
    private let router: PromoRouterDelegate
    
    init(router: PromoRouterDelegate) {
        self.router = router
    }
    
    func set(vc: PromoViewControllerDelegate) {
        self.vc = vc
    }
}

