//
//  HomeBannerCell.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 07.06.2022.
//

import UIKit

class HomeBannerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var pageControl: UIPageControl!
    var currentPage = 0

    private var homeBanner: [HomeBannerModel] = [
        .init(title: "Авторизация",
              description: "Зарегистрируйтесь соответсвием вашим интересам. Выберите роли клиента или специалиста.",
              image: UIImage(named: "autorization")!),
        .init(title: "Полный запуск",
              description: "Пристуйпайте к поиску специалиста или заказов, исходя от вашей профессии или нужды.",
              image: UIImage(named: "launch")!),
        .init(title: "Профиль",
              description: "Дополняйте нужную информацию в профиле для более уточненного поиска услуг.",
              image: UIImage(named: "profile")!)
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        configure()
    }
    
    func configure(){
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
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
