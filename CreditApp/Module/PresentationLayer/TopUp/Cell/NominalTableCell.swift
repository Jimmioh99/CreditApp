//
//  NominalTableCell.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit
import SnapKit

protocol NominalSectionDelegate: AnyObject {
    func didTapNominalButton(nominal: Int)
}

final class NominalTableCell: UITableViewCell {
    
    // MARK: - Variable
    
    weak var delegate: NominalSectionDelegate?
    
    var nominal: Int? = nil
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Nominal :"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var nominalLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var nominalBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(tapNominalButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray6
        return line
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
    
    @objc private func tapNominalButton() {
        guard let nominal = nominal else { return }
        delegate?.didTapNominalButton(nominal: nominal)
    }
    
    func setupCell(nominal: Int, text: String = "") {
        self.nominal = nominal
        
        nominalLbl.text = text != "" ? text : "\(nominal)"
        
        nominalBtn.setTitle("Rp. \(nominal)", for: .normal)
    }
    
    private func setupConstraints() {
        contentView.setupSubviews([titleLbl, nominalLbl, nominalBtn, line])
        
        titleLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(20)
        }
        
        nominalLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(4)
            make.leading.equalTo(titleLbl)
            make.bottom.equalTo(contentView).offset(-20)
        }
        
        nominalBtn.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).offset(-20)
            make.width.equalTo(UIScreen.main.bounds.width / 4)
            make.height.equalTo(40)
        }
        
        line.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(contentView)
            make.height.equalTo(1)
        }
    }
}
