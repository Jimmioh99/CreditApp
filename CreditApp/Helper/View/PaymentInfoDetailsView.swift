//
//  PaymentInfoDetailsView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit
import SnapKit

final class PaymentInfoDetailsView: UIView {
    
    // MARK: - Variable
    
    private lazy var mainView: InfoView = {
        let infoView = InfoView(title: "Payment Details")
        return infoView
    }()
    
    private lazy var detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var packetTextLbl: TitleTextView = {
        let view = TitleTextView()
        return view
    }()
    
    lazy var adminTextLbl: TitleTextView = {
        let view = TitleTextView()
        return view
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var payTextLbl: TitleTextView = {
        let view = TitleTextView()
        return view
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
    
    func setupView(nominal: String, text: String = "") {
        backgroundColor = .white
        
        let title = text != "" ? text : "\(nominal)"
        packetTextLbl.setupView(title: title, titleFont: .systemFont(ofSize: 14), text: "Rp. \(nominal)", textFont: .systemFont(ofSize: 14))
        adminTextLbl.setupView(title: "Admin Fee", titleFont: .systemFont(ofSize: 14), text: "Rp. 0", textFont: .systemFont(ofSize: 14))
        payTextLbl.setupView(title: "Pay in 30 days", titleFont: .boldSystemFont(ofSize: 14), text: "Rp. \(nominal)", textFont: .boldSystemFont(ofSize: 14))
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        setupSubviews([mainView, detailView])
        detailView.setupSubviews([packetTextLbl, adminTextLbl, line, payTextLbl])
        
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
        }
        
        detailView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self)
        }
        
        packetTextLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(detailView).offset(20)
            make.trailing.equalTo(detailView).offset(-20)
        }
        
        adminTextLbl.snp.makeConstraints { make in
            make.top.equalTo(packetTextLbl.snp.bottom).offset(20)
            make.leading.trailing.equalTo(packetTextLbl)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(adminTextLbl.snp.bottom).offset(20)
            make.leading.trailing.equalTo(detailView)
            make.height.equalTo(1)
        }
        
        payTextLbl.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(20)
            make.leading.trailing.equalTo(packetTextLbl)
            make.bottom.equalTo(detailView).offset(-20)
        }
    }
}
