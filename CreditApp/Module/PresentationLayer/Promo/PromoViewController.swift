//
//  PromoViewController.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit

protocol PromoViewControllerDelegate: UIViewController {}

final class PromoViewController: UIViewController {
    
    // MARK: - Variable
    
    private let presenter: PromoPresenterDelegate
    private lazy var root: PromoView = PromoView()
    
    var model: PromoModel
    
    var promoViewArr: [PromoViewModel] = []
    
    // MARK: - Construct
    
    init(presenter: PromoPresenterDelegate, model: PromoModel) {
        self.presenter = presenter
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        setPromoViewArr()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Merchant Promo"
        
        view = root
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    // MARK: - Functions
    
    private func setPromoViewArr() {
        promoViewArr = [
            PromoViewModel(value: model.imageURL?.absoluteString ?? "", type: .image),
            PromoViewModel(value: model.title, type: .headTitle),
            PromoViewModel(value: "Valid Date", type: .subTitle),
            PromoViewModel(value: model.date, type: .description),
            PromoViewModel(value: "Voucher Code", type: .subTitle),
            PromoViewModel(value: model.voucherCode, type: .voucherCode),
            PromoViewModel(value: "Term & Conditions", type: .subTitle),
        ]
        for (_, data) in model.termsAndConditions.enumerated() {
            promoViewArr.append(PromoViewModel(value: data, type: .listDescription))
        }
        root.promoTable.reloadData()
    }
    
    private func setDelegate() {
        root.promoTable.delegate = self
        root.promoTable.dataSource = self
    }
    
}

extension PromoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promoViewArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = promoViewArr[indexPath.row]
        
        switch data.type {
            
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PromoImageTableCell.self), for: indexPath) as! PromoImageTableCell
            cell.setupCell(imageStr: data.value)
            return cell
        case .voucherCode:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PromoVoucherCodeTableCell.self), for: indexPath) as! PromoVoucherCodeTableCell
            cell.setupCell(voucher: data.value)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PromoTextTableCell.self), for: indexPath) as! PromoTextTableCell
            cell.setupCell(text: data.value, font: data.type.fontSize, textColor: data.type.textColor)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard promoViewArr[indexPath.row].type == .voucherCode else { return }
        let voucherCode = model.voucherCode
        UIPasteboard.general.string = voucherCode
        showToast(message: "\(voucherCode) is copy to clipboard", font: .boldSystemFont(ofSize: 14))
    }
    
}

extension PromoViewController: PromoViewControllerDelegate {}
