//
//  LoanConfirmationViewController.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit

protocol LoanConfirmationViewControllerDelegate: UIViewController {}

final class LoanConfirmationViewController: UIViewController {
    
    // MARK: - Variable
    
    private let presenter: LoanConfirmationPresenterDelegate
    private lazy var root: LoanConfirmationView = LoanConfirmationView()
    
    private var phone: String
    private var nominal: Int
    
    init(presenter: LoanConfirmationPresenterDelegate, phone: String, nominal: Int) {
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
        
        title = "Loan Confirmation"
        view = root
        
        setupView()
        setDelegate()
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
        root.mobileLogoImg.image = MobileProvider(number: phone).phoneImage
        root.mobileLbl.text = phone
    }
    
    private func setDelegate() {
        root.payBtn.addTarget(self, action: #selector(payBtnTapped), for: .touchUpInside)
        root.pinHideBtn.addTarget(self, action: #selector(pinHideBtnTapped), for: .touchUpInside)
    }
    
    @objc private func payBtnTapped() {
        guard let pin = root.pinTF.text, pin != "" else {
            showToast(message: "Masukkan PIN", font: .systemFont(ofSize: 14))
            return
        }
        presenter.pushToPaymentDetails(phone: phone, nominal: nominal)
    }
    
    @objc private func pinHideBtnTapped() {
        root.pinHideBtn.setImage(UIImage(named: root.pinTF.isSecureTextEntry ? "ic_unhide_password" : "ic_hide_password"), for: .normal)
        root.pinTF.isSecureTextEntry.toggle()
    }
    
}

extension LoanConfirmationViewController: LoanConfirmationViewControllerDelegate {}
