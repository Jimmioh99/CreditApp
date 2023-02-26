//
//  PromoView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit
import SnapKit
import Kingfisher

final class PromoView: UIView {
    
    // MARK: - Variable
    
    lazy var navView: UIView = {
        let view = NavigationView(title: "Merchant Promo", type: NavigationType.pop)
        return view
    }()
    
    lazy var promoTable: UITableView = {
        let table = UITableView()
        table.register(PromoImageTableCell.self, forCellReuseIdentifier: String(describing: PromoImageTableCell.self))
        table.register(PromoTextTableCell.self, forCellReuseIdentifier: String(describing: PromoTextTableCell.self))
        table.register(PromoVoucherCodeTableCell.self, forCellReuseIdentifier: String(describing: PromoVoucherCodeTableCell.self))
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.bounces = false
        return table
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
        setupSubviews([navView, promoTable])
        
        navView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
        }
        
        promoTable.snp.makeConstraints { make in
            make.top.equalTo(navView.snp.bottom)
            make.leading.trailing.equalTo(navView)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
