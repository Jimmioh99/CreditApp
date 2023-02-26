//
//  PaymentDetailsView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit
import SnapKit

final class PaymentDetailsView: UIView {
    
    // MARK: - Variable
    
    lazy var navView: UIView = {
        let view = NavigationView(title: "Payment Details", type: NavigationType.dismiss)
        return view
    }()
    
    lazy var orderView: OrderInfoDetailsView = {
        let view = OrderInfoDetailsView()
        view.setCornerRadiusWithShadow()
        return view
    }()
    
    lazy var paymentView: PaymentInfoDetailsView = {
        let view = PaymentInfoDetailsView()
        view.setCornerRadiusWithShadow()
        return view
    }()
    
    private let invoiceView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.setCornerRadiusWithShadow()
        return view
    }()
    
    private let invoiceLbl: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        
        let attrStr = NSMutableAttributedString()
        let preText = NSAttributedString(
            string: "Invoice has been emailed to you\nHave problem? Email us at ",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.darkGray
            ])
        let emailText = NSAttributedString(
            string: "support@kredivo.com",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.systemBlue
            ])
        attrStr.append(preText)
        attrStr.append(emailText)
        label.attributedText = attrStr
        return label
    }()
    
    lazy var okBtn: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        setupSubviews([navView, orderView, paymentView, invoiceView, okBtn])
        invoiceView.addSubview(invoiceLbl)
        
        navView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
        }
        
        orderView.snp.makeConstraints { make in
            make.top.equalTo(navView.snp.bottom).offset(20)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
        
        paymentView.snp.makeConstraints { make in
            make.top.equalTo(orderView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(orderView)
        }
        
        invoiceView.snp.makeConstraints { make in
            make.top.equalTo(paymentView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(orderView)
        }
        
        invoiceLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(invoiceView).offset(20)
            make.trailing.bottom.equalTo(invoiceView).offset(-20)
        }
        
        okBtn.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(60)
        }
    }
}
