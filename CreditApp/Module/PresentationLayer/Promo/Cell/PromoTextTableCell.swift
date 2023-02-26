//
//  PromoTextTableCell.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit
import SnapKit

final class PromoTextTableCell: UITableViewCell {
    
    // MARK: - Variable
    
    private lazy var textLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
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
    
    func setupCell(text: String, font: UIFont, textColor: UIColor) {
        textLbl.text = text
        textLbl.font = font
        textLbl.textColor = textColor
    }
    
    private func setupConstraints() {
        contentView.setupSubviews([textLbl])
        
        textLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(10)
            make.trailing.equalTo(contentView).offset(-10)
            make.bottom.equalTo(contentView)
        }
    }
}
