//
//  MainViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 01.04.2022.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate {
    let search: UISearchController = {
        let vc = UISearchController()
        vc.searchBar.placeholder = "Поиск"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()

    let scrollView = UIScrollView()

    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.backgroundColor = .systemGray
        pageControl.clipsToBounds = true
        pageControl.tintColor = .gray
        return pageControl
    }()
    
    let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection?  in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 2, leading: 7, bottom: 2, trailing: 7
            )
            
//            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(400)), subitem: item, count: 3)
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(125)), subitem: item, count: 2)
            
            horizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .paging
            return section
        })
        )


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        search.searchBar.delegate = self
        navigationItem.searchController = search
        scrollView.backgroundColor = .systemGray
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        collectionView.register(ServiceCollectionViewCell.self, forCellWithReuseIdentifier: ServiceCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        scrollView.frame = CGRect(x: 20, y: 190, width: 370, height: 112)
        pageControl.frame = CGRect(x: 180, y: 310, width: 50, height: 20)

        if scrollView.subviews.count == 2{
            configureScrollView()
        }
        
        collectionView.frame = CGRect(x: 20, y: 320, width: 370, height: 500)
    }

    private func configureScrollView(){

    }
}


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    

    
    
}
