//
//  PromoVoucherCodeTableCell.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit
import SnapKit

final class PromoVoucherCodeTableCell: UITableViewCell {
    
    // MARK: - Variable
    
    private lazy var voucherView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.backgroundColor = .systemGray6
        return view
    }()

    private lazy var voucherLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)

        return label
    }()

    private lazy var voucherLine: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()

    lazy var voucherBtn: UIButton = {
        let button = UIButton()
        button.setTitle("COPY", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func setupCell(voucher: String) {
        voucherLbl.text = voucher
    }
    
    private func setupConstraints() {
        contentView.setupSubviews([voucherView])
        voucherView.setupSubviews([voucherLbl, voucherLine, voucherBtn])
        
        voucherView.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(10)
            make.trailing.bottom.equalTo(contentView).offset(-10)
            make.height.equalTo(50)
        }

        voucherLbl.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(voucherView)
        }

        voucherLine.snp.makeConstraints { make in
            make.top.bottom.equalTo(voucherView)
            make.leading.equalTo(voucherLbl.snp.trailing)
            make.trailing.equalTo(voucherBtn.snp.leading)
            make.width.equalTo(1)
        }

        voucherBtn.snp.makeConstraints { make in
            make.top.trailing.bottom.equalTo(voucherView)
            make.width.equalTo(UIScreen.main.bounds.width / 4)
        }
    }
}
