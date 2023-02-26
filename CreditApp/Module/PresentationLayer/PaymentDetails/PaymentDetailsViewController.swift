//
//  PaymentDetailsViewController.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit

protocol PaymentDetailsViewControllerDelegate: UIViewController {}

final class PaymentDetailsViewController: UIViewController {
    
    // MARK: - Variable
    
    private let presenter: PaymentDetailsPresenterDelegate
    private lazy var root: PaymentDetailsView = PaymentDetailsView()
    
    private var phone: String
    private var nominal: Int
    
    init(presenter: PaymentDetailsPresenterDelegate, phone: String, nominal: Int) {
        self.presenter = presenter
        self.phone = phone
        self.nominal = nominal
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Construct
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Payment Details"
        
        view = root
        
        setupView()
        setTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Functions
    
    private func setupView() {
        root.paymentView.setupView(nominal: "\(nominal)")
        root.orderView.setupView(phone: phone)
    }
    
    private func setTarget() {
        root.okBtn.addTarget(self, action: #selector(okBtnTapped), for: .touchUpInside)
    }
    
    @objc private func okBtnTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

extension PaymentDetailsViewController: PaymentDetailsViewControllerDelegate {}
