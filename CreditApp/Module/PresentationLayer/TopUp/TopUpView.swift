//
//  TopUpView.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit
import SnapKit

final class TopUpView: UIView {
    
    // MARK: - Variable
    
    lazy var segmentedView: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Pulsa", "Data Package"])
        segmented.selectedSegmentIndex = 0
        segmented.backgroundColor = .white
        return segmented
    }()
    
    private lazy var mobileContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mobileStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.backgroundColor = .white
        return stack
    }()
    
    lazy var mobileImgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.borderWidth = 2
        view.isHidden = true
        return view
    }()
    
    lazy var mobileImg: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var mobileMainView: UIView = UIView()
    
    private lazy var mobileTextLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "Mobile number"
        return label
    }()
    
    lazy var mobileTF: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .phonePad
        return textField
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var closeView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var closeBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_cancel"), for: .normal)
        return button
    }()
    
    private lazy var contactView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var contactBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_contact"), for: .normal)
        return button
    }()
    
    lazy var listTable: UITableView = {
        let table = UITableView()
        table.register(NominalTableCell.self, forCellReuseIdentifier: String(describing: NominalTableCell.self))
        table.isHidden = true
        table.backgroundColor = .white
        table.separatorStyle = .none
        table.bounces = false
        return table
    }()
    
    private lazy var promoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var promoTextLbl: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Promos"
        return label
    }()
    
    lazy var promoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        
        let collection = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        collection.register(PromoCollectionCell.self, forCellWithReuseIdentifier: String(describing: PromoCollectionCell.self))
        return collection
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func setupConstraints() {
        setupSubviews([segmentedView, mobileContentView, listTable, promoView])
        mobileContentView.addSubview(mobileStack)
        
        mobileStack.setupArrangedSubview([mobileImgView, mobileMainView, contactView])
        contactView.addSubview(contactBtn)
        mobileImgView.addSubview(mobileImg)
        mobileMainView.setupSubviews([mobileTextLbl, mobileTF, lineView, closeView])
        closeView.addSubview(closeBtn)
        
        promoView.setupSubviews([promoTextLbl, promoCollection])
        
        segmentedView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(40)
        }
        
        mobileContentView.snp.makeConstraints { make in
            make.top.equalTo(segmentedView.snp.bottom)
            make.leading.trailing.equalTo(self)
        }
        
        mobileStack.snp.makeConstraints { make in
            make.top.leading.equalTo(mobileContentView).offset(20)
            make.trailing.bottom.equalTo(mobileContentView).offset(-20)
        }
        
        mobileImgView.snp.makeConstraints { make in
            make.size.equalTo(60)
        }
        
        mobileImg.snp.makeConstraints { make in
            make.top.leading.equalTo(mobileImgView).offset(10)
            make.trailing.bottom.equalTo(mobileImgView).offset(-10)
        }
        
        mobileTextLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(mobileMainView)
        }
        
        mobileTF.snp.makeConstraints { make in
            make.top.equalTo(mobileTextLbl.snp.bottom).offset(10)
            make.leading.equalTo(mobileTextLbl)
            make.trailing.equalTo(closeBtn.snp.leading).offset(10)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(mobileTF.snp.bottom).offset(4)
            make.leading.trailing.bottom.equalTo(mobileMainView)
            make.height.equalTo(1)
        }
        
        
        closeView.snp.makeConstraints { make in
            make.centerY.equalTo(mobileTF)
            make.trailing.equalTo(mobileMainView)
            make.width.height.equalTo(20)
        }
        
        closeBtn.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(closeView)
        }
        
        contactBtn.snp.makeConstraints { make in
            make.centerY.equalTo(closeBtn)
            make.leading.trailing.equalTo(contactView)
            make.width.height.equalTo(closeBtn)
        }
        
        listTable.snp.makeConstraints { make in
            make.top.equalTo(mobileContentView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(segmentedView)
            make.bottom.equalTo(promoView.snp.top).offset(-10)
        }
        
        promoView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(segmentedView)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        promoTextLbl.snp.makeConstraints { make in
            make.top.leading.equalTo(promoView).offset(20)
        }
        
        promoCollection.snp.makeConstraints { make in
            make.top.equalTo(promoTextLbl.snp.bottom).offset(10)
            make.leading.trailing.equalTo(promoView)
            make.bottom.equalTo(promoView).offset(-10)
            make.height.equalTo(UIScreen.main.bounds.width * 4 / 5 / 2)
        }
    }
}
