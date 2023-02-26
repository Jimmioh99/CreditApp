//
//  InfoView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit
import SnapKit

final class InfoView: UIView {
    
    // MARK: - Variable
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    // MARK: - Initialization
    
    init(title: String) {
        super.init(frame: CGRect())
        titleLbl.text = title
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func setupConstraints() {
        setupSubviews([mainView, titleLbl, lineView])
        
        mainView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(self)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(20)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalTo(mainView)
            make.height.equalTo(1)
        }
    }
}
