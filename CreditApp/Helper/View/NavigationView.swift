//
//  NavigationView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit
import SnapKit

final class NavigationView: UIView {
    
    // MARK: - Variable
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_back"), for: .normal)
        return button
    }()
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var type: NavigationType
    
    // MARK: - Initialization
    
    init(title: String, type: NavigationType) {
        self.type = type
        super.init(frame: CGRect())
        
        titleLbl.text = title
        backBtn.setImage(Navigation(type: type).image, for: .normal)
        
        setupConstraints()
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func setupButton() {
        backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    @objc private func backBtnTapped() {
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        guard let topController = keyWindow?.rootViewController else { return }
        guard let navigation = topController as? UINavigationController else { return }
        navigation.popToRootViewController(animated: true)
    }
    
    private func setupConstraints() {
        setupSubviews([mainView, titleLbl, backBtn])
        
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(self)
            make.height.equalTo(60)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.center.equalTo(mainView)
        }
        
        backBtn.snp.makeConstraints { make in
            make.centerY.equalTo(mainView)
            make.leading.equalTo(mainView).offset(20)
            make.size.equalTo(24)
        }
    }
}
