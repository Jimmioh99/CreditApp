//
//  TopUpViewController.swift
//  CreditApp
//
//  Created by Jimmi Oh on 25/02/23.
//

import UIKit

protocol TopUpViewControllerDelegate: UIViewController {}

final class TopUpViewController: UIViewController {
    
    // MARK: - Variable
    
    private let presenter: TopUpPresenterDelegate
    private lazy var root: TopUpView = TopUpView()
    
    let nominalArr: [Int] = [25000, 50000, 100000, 150000, 200000]
    let dataPackageArr: [DataPackageModel] = [
        DataPackageModel(text: "Internet Bulanan 25rb", nominal: 25000),
        DataPackageModel(text: "Internet Bulanan 50rb", nominal: 50000),
        DataPackageModel(text: "Internet Bulanan 100rb", nominal: 100000),
        DataPackageModel(text: "Internet Bulanan 150rb", nominal: 150000),
        DataPackageModel(text: "Internet Bulanan 200rb", nominal: 200000),
    ]
    
    let promoArr: [PromoModel] = [
        PromoModel(
            imageURL: URL(string: "https://ekaceluller.com/wp-content/uploads/2022/06/KV-banner-01-1024x486.jpg"),
            title: "Discount 20% at Kedai Hape Original, Mall Kost Kasablanka",
            date: "10 - 31 Januari 2019",
            voucherCode: "BIRTHDAY9",
            termsAndConditions: [
                "• Promo berlaku untuk transaksi yang dilakukan diaplikasi terbaru Bukalapak",
                "• Gunakan kode BIRTHDAY9 untuk dapatkan cashback sebesar 3%.",
                "• Promo hanya berlaku untuk transaksi yang menggunakan metode pengiriman J&T Express dan Ninja Xpress (REG dan FAST).",
                "• Setiap pengguna bisa menggunakan promo sebanyak 1 (satu) kali per hari dan maksimal 2 (dua) kali selama periode Promo.",
                "• Promo bisa digunakan untuk belanja produk kategori apa saja yang ada di Bukalapak, kecuali kategori tiket dan voucher, produk virtual (pulsa, paket data, voucher game, listrik prabayar & pascabayar, tiket event, tiket pesawat, tiket kereta, pembayaran zakat online, pembayaran tagihan listrik, air PDAM, dan BPJS) dan"
            ]),
        PromoModel(
            imageURL: URL(string: "https://i0.wp.com/blog.kredivo.com/wp-content/uploads/2020/10/cicilan-0-des.jpg?fit=1698%2C947&ssl=1"),
            title: "Discount 20% at Kedai Hape Original, Mall Kost Kasablanka",
            date: "10 - 31 Januari 2019",
            voucherCode: "BIRTHDAY9",
            termsAndConditions: [
                "• Promo berlaku untuk transaksi yang dilakukan diaplikasi terbaru Bukalapak",
                "• Gunakan kode BIRTHDAY9 untuk dapatkan cashback sebesar 3%.",
                "• Promo hanya berlaku untuk transaksi yang menggunakan metode pengiriman J&T Express dan Ninja Xpress (REG dan FAST).",
                "• Setiap pengguna bisa menggunakan promo sebanyak 1 (satu) kali per hari dan maksimal 2 (dua) kali selama periode Promo.",
                "• Promo bisa digunakan untuk belanja produk kategori apa saja yang ada di Bukalapak, kecuali kategori tiket dan voucher, produk virtual (pulsa, paket data, voucher game, listrik prabayar & pascabayar, tiket event, tiket pesawat, tiket kereta, pembayaran zakat online, pembayaran tagihan listrik, air PDAM, dan BPJS) dan"
            ]),
        PromoModel(
            imageURL: URL(string: "https://ekaceluller.com/wp-content/uploads/2022/10/KV-kesamber-merchant-2-scaled.jpg"),
            title: "Discount 20% at Kedai Hape Original, Mall Kost Kasablanka",
            date: "10 - 31 Januari 2019",
            voucherCode: "BIRTHDAY9",
            termsAndConditions: [
                "• Promo berlaku untuk transaksi yang dilakukan diaplikasi terbaru Bukalapak",
                "• Gunakan kode BIRTHDAY9 untuk dapatkan cashback sebesar 3%.",
                "• Promo hanya berlaku untuk transaksi yang menggunakan metode pengiriman J&T Express dan Ninja Xpress (REG dan FAST).",
                "• Setiap pengguna bisa menggunakan promo sebanyak 1 (satu) kali per hari dan maksimal 2 (dua) kali selama periode Promo.",
                "• Promo bisa digunakan untuk belanja produk kategori apa saja yang ada di Bukalapak, kecuali kategori tiket dan voucher, produk virtual (pulsa, paket data, voucher game, listrik prabayar & pascabayar, tiket event, tiket pesawat, tiket kereta, pembayaran zakat online, pembayaran tagihan listrik, air PDAM, dan BPJS) dan"
            ])
    ]

    // MARK: - Construct
    
    init(presenter: TopUpPresenterDelegate) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = root
        
        setDelegate()
        setTarget()
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
    
    private func setDelegate() {
        root.listTable.delegate = self
        root.listTable.dataSource = self
        
        root.promoCollection.delegate = self
        root.promoCollection.dataSource = self
    }
    
    private func setTarget() {
        root.segmentedView.addTarget(self, action: #selector(segmentedDidChange), for: .valueChanged)
        root.mobileTF.addTarget(self, action: #selector(mobileTFDidChanged), for: .editingChanged)
        root.closeBtn.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
        root.contactBtn.addTarget(self, action: #selector(contactBtnTapped), for: .touchUpInside)
    }
    
    @objc private func segmentedDidChange() {
        root.listTable.reloadData()
    }
    
    @objc private func mobileTFDidChanged() {
        guard let phoneNumber = root.mobileTF.text, phoneNumber != "" else {
            root.closeBtn.isHidden = true
            return
        }
        root.closeBtn.isHidden = false
        let mobileProvider = MobileProvider(number: phoneNumber)
        root.mobileImg.image = mobileProvider.phoneImage
        setHidden(hide: mobileProvider.provider == .noProvider)
    }
    
    @objc private func closeBtnTapped() {
        root.mobileTF.text = ""
        root.mobileTF.resignFirstResponder()
        root.closeBtn.isHidden = true
        setHidden(hide: true)
    }
    
    @objc private func contactBtnTapped() {
        // go to contact view
        showToast(message: "Nantikan update selanjutnya", font: .systemFont(ofSize: 14))
    }
    
    private func setHidden(hide: Bool) {
        root.mobileImgView.isHidden = hide
        root.listTable.isHidden = hide
    }
}

extension TopUpViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return root.segmentedView.selectedSegmentIndex == 0 ? nominalArr.count : dataPackageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NominalTableCell.self), for: indexPath) as! NominalTableCell
        if root.segmentedView.selectedSegmentIndex == 0 {
            let data = nominalArr[indexPath.row]
            cell.setupCell(nominal: data)
        } else {
            let data = dataPackageArr[indexPath.row]
            cell.setupCell(nominal: data.nominal, text: data.text)
        }
        cell.delegate = self
        return cell
    }
}

extension TopUpViewController: TopUpViewControllerDelegate {}

extension TopUpViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promoArr.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PromoCollectionCell.self), for: indexPath) as! PromoCollectionCell
        cell.setupCell(imageURL: promoArr[indexPath.row].imageURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width * 4 / 5
        let height = width / 2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = promoArr[indexPath.row]
        presenter.pushToPromo(model: model)
    }
}

extension TopUpViewController: NominalSectionDelegate {
    func didTapNominalButton(nominal: Int) {
        guard let phone = root.mobileTF.text, phone != "" else { return }
        presenter.pushToLoanConfirmation(phone: phone, nominal: nominal)
    }
}
