//
//  TitleTextView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit
import SnapKit

final class TitleTextView: UIView {
    
    // MARK: - Variable
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textLbl: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    func setupView(title: String, titleFont: UIFont, titleColor: UIColor = .black, text: String, textFont: UIFont, textColor: UIColor = .black) {
        titleLbl.text = title
        titleLbl.font = titleFont
        titleLbl.textColor = titleColor
        
        textLbl.text = text
        textLbl.font = textFont
        textLbl.textColor = textColor
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        setupSubviews([titleLbl, textLbl])
        
        titleLbl.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(self)
            make.trailing.equalTo(textLbl.snp.trailing).offset(-10)
        }
        
        textLbl.snp.makeConstraints { make in
            make.top.trailing.bottom.equalTo(self)
        }
    }
}
