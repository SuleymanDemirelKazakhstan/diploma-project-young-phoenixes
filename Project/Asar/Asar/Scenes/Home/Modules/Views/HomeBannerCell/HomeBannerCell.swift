//
//  HomeBannerCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 07.06.2022.
//

import UIKit

class HomeBannerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    private var homeBanner: [HomeBannerModel] = [
        .init(title: "Авторизация",
              description: "Зарегистрируйтесь соответсвием вашим интересам. Выберите роли клиента или специалиста.",
              image: UIImage(named: "autorization")!,
              backgroundColor: .init(red: 0.816, green: 0.925, blue: 0.859, alpha: 1)),
        .init(title: "Полный запуск",
              description: "Пристуйпайте к поиску специалиста или заказов, исходя от вашей профессии или нужды.",
              image: UIImage(named: "launch")!,
              backgroundColor: .init(red: 0.78, green: 0.902, blue: 0.929, alpha: 1)),
        .init(title: "Профиль",
              description: "Дополняйте нужную информацию в профиле для более уточненного поиска услуг.",
              image: UIImage(named: "profile")!,
              backgroundColor: UIColor(red: 0.946, green: 0.953, blue: 0.855, alpha: 1))
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        configure()
    }
    
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    private func setupCollectionView(){
        [HomeBannerView.self].forEach { collectionView.register(cellClass: $0)
        }
    }
}

extension HomeBannerCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeBanner.count
    }
}

extension HomeBannerCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeBannerView = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: homeBanner[indexPath.item])
        return cell
    }
}

extension HomeBannerCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: collectionView.frame.height)
    }
}
