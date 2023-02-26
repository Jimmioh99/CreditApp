//
//  PromoCollectionCell.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit
import SnapKit
import Kingfisher

final class PromoCollectionCell: UICollectionViewCell {
    
    // MARK: - Variable
    
    lazy var promoImg: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func setupCell(imageURL: URL?) {
        guard let url = imageURL else { return }
        promoImg.kf.setImage(with: url)
    }
    
    private func setupConstraints() {
        
        contentView.addSubview(promoImg)
        
        promoImg.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.leading.equalTo(contentView)//.offset(20)
            make.trailing.equalTo(contentView)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
