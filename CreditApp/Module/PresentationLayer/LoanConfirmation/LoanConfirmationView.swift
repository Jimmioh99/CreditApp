//
//  LoanConfirmationView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit
import SnapKit

final class LoanConfirmationView: UIView {
    
    // MARK: - Variable
    
    private lazy var navView: UIView = {
        let view = NavigationView(title: "Loan Confirmation", type: NavigationType.pop)
        return view
    }()
    
    private lazy var mainScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.bounces = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var mobileView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 1.0
        view.layer.shadowOffset = CGSize(width: 0, height: 6)
        view.layer.shadowColor = UIColor.gray.cgColor
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
    
    private let otpView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.setCornerRadiusWithShadow()
        return view
    }()
    
    private let otpLbl: UILabel = {
        let label = UILabel()
        label.text = "OTP is not needed for first transaction of the day that is less than RP 200,000"
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var paymentView: PaymentInfoDetailsView = {
        let view = PaymentInfoDetailsView()
        view.backgroundColor = .white
        view.setCornerRadiusWithShadow()
        return view
    }()
    
    private lazy var pinMainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setCornerRadiusWithShadow()
        return view
    }()
    
    private lazy var pinView: InfoView = {
        let infoView = InfoView(title: "Kredivo PIN")
        return infoView
    }()
    
    private lazy var pinDetailView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var pinTextLbl: UILabel = {
        let label = UILabel()
        label.text = "PIN"
        return label
    }()
    
    lazy var pinTF: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.keyboardType = .phonePad
        return textField
    }()
    
    lazy var pinHideBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_hide_password"), for: .normal)
        return button
    }()
    
    private lazy var pinLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    lazy var pinAgreementLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let attrStr = NSMutableAttributedString()
        let preText = NSAttributedString(
            string: "By continuing, I agree with ",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.darkGray
            ])
        let emailText = NSAttributedString(
            string: "loan agreement of Kredivo",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.systemBlue
            ])
        attrStr.append(preText)
        attrStr.append(emailText)
        label.attributedText = attrStr
        return label
    }()
    
    lazy var payBtn: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("PAY", for: .normal)
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
        setupSubviews([navView, mainScroll, payBtn])
        mainScroll.addSubview(mainView)
        mainView.setupSubviews([mobileView, otpView, paymentView, pinMainView])
        mobileView.setupSubviews([mobileLogoImg, mobileLbl])
        otpView.addSubview(otpLbl)
        pinMainView.setupSubviews([pinView, pinDetailView])
        pinDetailView.setupSubviews([pinTextLbl, pinTF, pinHideBtn, pinLine, pinAgreementLbl])
        
        navView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
        }
        
        mainScroll.snp.makeConstraints { make in
            make.top.equalTo(navView.snp.bottom)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(payBtn.snp.top)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(mainScroll)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        mobileView.snp.makeConstraints { make in
            make.top.equalTo(mainView)
            make.leading.trailing.equalTo(mainView)
            make.height.equalTo(80)
        }
        
        mobileLogoImg.snp.makeConstraints { make in
            make.centerY.equalTo(mobileView)
            make.leading.equalTo(20)
            make.size.equalTo(40)
        }
        
        mobileLbl.snp.makeConstraints { make in
            make.centerY.equalTo(mobileView)
            make.leading.equalTo(mobileLogoImg.snp.trailing).offset(20)
        }
        
        otpView.snp.makeConstraints { make in
            make.top.equalTo(mobileView.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
        }
        
        otpLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(otpView).offset(20)
            make.trailing.bottom.equalTo(otpView).offset(-20)
        }
        
        paymentView.snp.makeConstraints { make in
            make.top.equalTo(otpView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(otpView)
        }
        
        pinMainView.snp.makeConstraints { make in
            make.top.equalTo(paymentView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(otpView)
            make.bottom.equalTo(mainView).offset(-20)
        }
        
        pinView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(pinMainView)
        }
        
        pinDetailView.snp.makeConstraints { make in
            make.top.equalTo(pinView.snp.bottom)
            make.leading.trailing.bottom.equalTo(pinMainView)
        }
        
        pinTextLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(pinDetailView).offset(20)
        }
        
        pinTF.snp.makeConstraints { make in
            make.top.equalTo(pinTextLbl.snp.bottom).offset(20)
            make.leading.equalTo(pinTextLbl)
            make.trailing.equalTo(pinHideBtn.snp.trailing).offset(-10)
        }
        
        pinHideBtn.snp.makeConstraints { make in
            make.centerY.equalTo(pinTF)
            make.trailing.equalTo(pinLine)
            make.size.equalTo(32)
        }
        
        pinLine.snp.makeConstraints { make in
            make.top.equalTo(pinTF.snp.bottom).offset(4)
            make.leading.equalTo(pinTextLbl)
            make.trailing.equalTo(pinDetailView).offset(-20)
            make.height.equalTo(1)
        }
        
        pinAgreementLbl.snp.makeConstraints { make in
            make.top.equalTo(pinLine.snp.bottom).offset(20)
            make.leading.trailing.equalTo(pinLine)
            make.bottom.equalTo(pinDetailView).offset(-20)
        }
        
        payBtn.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(60)
        }
    }
}
