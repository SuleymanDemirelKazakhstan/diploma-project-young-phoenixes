//
//  HomeCategoriesCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 02.05.2022.
//

import UIKit

protocol HomeCategoriesCellDelegate: AnyObject {
    func categoryDidSelect(_ cell: HomeCategoriesCell, indexPath: IndexPath)
}

class HomeCategoriesCell: UITableViewCell {
    private var homeCategories: [HomeCategoryViewModel] = [
        .init(name: L10n.mainPlumberTitle, image: Asset.wrench.image),
        .init(name: L10n.mainHouseholdRepairsTitle, image: Asset.hammer.image),
        .init(name: L10n.mainCargoTitle, image: Asset.truck.image),
        .init(name: L10n.mainCleaningTitle, image: Asset.wrench.image),
        .init(name: L10n.mainBeautyTitle, image: Asset.crown.image),
        .init(name: L10n.mainElecticianTitle, image: Asset.toolbox.image)]
    weak var delegate: HomeCategoriesCellDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    func configure() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }

    private func setupCollectionView() {
        [HomeCategoryCell.self].forEach { collectionView.register(cellClass: $0) }
    }
}

extension HomeCategoriesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeCategories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCategoryCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: homeCategories[indexPath.item])
        return cell
    }
}

extension HomeCategoriesCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.categoryDidSelect(self, indexPath: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 164, height: 88)
    }
}
