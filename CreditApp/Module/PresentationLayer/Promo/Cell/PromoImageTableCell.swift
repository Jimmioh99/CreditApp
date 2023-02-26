//
//  PromoImageTableCell.swift
//  CreditApp
//
//  Created by Jimmi Oh on 26/02/23.
//

import UIKit
import SnapKit
import Kingfisher

final class PromoImageTableCell: UITableViewCell {
    
    // MARK: - Variable
    
    private lazy var iconImg: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
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
    
    func setupCell(imageStr: String) {
        guard let url = URL(string: imageStr) else { return }
        iconImg.kf.setImage(with: url)
    }
    
    private func setupConstraints() {
        contentView.setupSubviews([iconImg])
        
        iconImg.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(contentView)
            make.height.equalTo(UIScreen.main.bounds.width / 2)
        }
    }
}
