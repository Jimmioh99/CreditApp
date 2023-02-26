//
//  OrderInfoDetailsView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit
import SnapKit

final class OrderInfoDetailsView: UIView {
    
    // MARK: - Variable
    
    private lazy var mainView: InfoView = {
        let infoView = InfoView(title: "Order Details")
        return infoView
    }()
    
    private lazy var detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var mobileLogoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray6.cgColor
        return view
    }()
    
    lazy var mobileLogoImg: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var mobileLbl: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var statusTextLbl: TitleTextView = {
        let view = TitleTextView()
        return view
    }()
    
    lazy var orderTextLbl: TitleTextView = {
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
    
    func setupView(phone: String) {
        backgroundColor = .white
        
        mobileLbl.text = phone
        mobileLogoImg.image = MobileProvider(number: phone).phoneImage
        
        statusTextLbl.setupView(title: "Status", titleFont: .systemFont(ofSize: 14), text: "Success", textFont: .systemFont(ofSize: 14), textColor: .green)
        orderTextLbl.setupView(title: "Order ID", titleFont: .systemFont(ofSize: 14), text: "KB-8027de03", textFont: .systemFont(ofSize: 14))
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        setupSubviews([mainView, detailView])
        detailView.setupSubviews([mobileLogoView, mobileLbl, line, statusTextLbl, orderTextLbl])
        mobileLogoView.addSubview(mobileLogoImg)
        
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
        }
        
        detailView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self)
        }
        
        mobileLogoView.snp.makeConstraints { make in
            make.top.leading.equalTo(detailView).offset(20)
        }
        
        mobileLogoImg.snp.makeConstraints { make in
            make.top.leading.equalTo(mobileLogoView).offset(10)
            make.trailing.bottom.equalTo(mobileLogoView).offset(-10)
            make.size.equalTo(40)
        }
        
        mobileLbl.snp.makeConstraints { make in
            make.centerY.equalTo(mobileLogoImg)
            make.leading.equalTo(mobileLogoImg.snp.trailing).offset(20)
        }
        
        line.snp.makeConstraints { make in
            make.top.equalTo(mobileLogoView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(detailView)
            make.height.equalTo(1)
        }
        
        statusTextLbl.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(20)
            make.leading.equalTo(detailView).offset(20)
            make.trailing.equalTo(detailView).offset(-20)
        }
        
        orderTextLbl.snp.makeConstraints { make in
            make.top.equalTo(statusTextLbl.snp.bottom).offset(20)
            make.leading.trailing.equalTo(statusTextLbl)
            make.bottom.equalTo(detailView).offset(-20)
        }
    }
}
