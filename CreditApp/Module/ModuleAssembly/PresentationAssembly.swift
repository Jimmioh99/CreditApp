//
//  PresentationAssembly.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import Swinject

final class PresentationAssembly: Assembly {
    func assemble(container: Container) {
        // MARK: - Navigator
        container.register(Navigator.self) { r, view in
            NavigatorImpl(viewController: view)
        }
        
        // MARK: - TopUpScreen
        container.register(TopUpPresenterDelegate.self) { r in
            TopUpPresenter(router: r.resolve(TopUpRouterDelegate.self)!)
        }
        container.register(TopUpRouterDelegate.self) { r in
            TopUpRouter()
        }
        container.register(TopUpViewControllerDelegate.self) { r in
            let router = r.resolve(TopUpRouterDelegate.self)!
            let presenter = r.resolve(TopUpPresenterDelegate.self)!

            let view = TopUpViewController(presenter: presenter)
            let navigator = r.resolve(Navigator.self, argument: view as UIViewController)!
            router.set(navigator: navigator)
            presenter.set(vc: view)
            return view
        }
        
        // MARK: - LoanConfirmationScreen
        container.register(LoanConfirmationPresenterDelegate.self) { r in
            LoanConfirmationPresenter(router: r.resolve(LoanConfirmationRouterDelegate.self)!)
        }
        container.register(LoanConfirmationRouterDelegate.self) { r in
            LoanConfirmationRouter()
        }
        container.register(LoanConfirmationViewControllerDelegate.self) { r, phone, nominal in
            let router = r.resolve(LoanConfirmationRouterDelegate.self)!
            let presenter = r.resolve(LoanConfirmationPresenterDelegate.self)!

            let view = LoanConfirmationViewController(presenter: presenter, phone: phone, nominal: nominal)
            let navigator = r.resolve(Navigator.self, argument: view as UIViewController)!
            router.set(navigator: navigator)
            presenter.set(vc: view)
            return view
        }
        
        // MARK: - PaymentDetailsScreen
        container.register(PaymentDetailsPresenterDelegate.self) { r in
            PaymentDetailsPresenter(router: r.resolve(PaymentDetailsRouterDelegate.self)!)
        }
        container.register(PaymentDetailsRouterDelegate.self) { r in
            PaymentDetailsRouter()
        }
        container.register(PaymentDetailsViewControllerDelegate.self) { r, phone, nominal in
            let router = r.resolve(PaymentDetailsRouterDelegate.self)!
            let presenter = r.resolve(PaymentDetailsPresenterDelegate.self)!

            let view = PaymentDetailsViewController(presenter: presenter, phone: phone, nominal: nominal)
            let navigator = r.resolve(Navigator.self, argument: view as UIViewController)!
            router.set(navigator: navigator)
            presenter.set(vc: view)
            return view
        }
        
        // MARK: - PromoScreen
        container.register(PromoPresenterDelegate.self) { r in
            PromoPresenter(router: r.resolve(PromoRouterDelegate.self)!)
        }
        container.register(PromoRouterDelegate.self) { r in
            PromoRouter()
        }
        container.register(PromoViewControllerDelegate.self) { r, model in
            let router = r.resolve(PromoRouterDelegate.self)!
            let presenter = r.resolve(PromoPresenterDelegate.self)!

            let view = PromoViewController(presenter: presenter, model: model)
            let navigator = r.resolve(Navigator.self, argument: view as UIViewController)!
            router.set(navigator: navigator)
            presenter.set(vc: view)
            return view
        }
    }
}
