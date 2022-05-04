//
//  HomeRecommendationsCell.swift
//  Asar
//
//  Created by Abylbek Khassenov on 04.05.2022.
//

import UIKit

class HomeRecommendationsCell: UITableViewCell {
    private var homeRecommendations: [HomeRecommendationViewModel] =
        [
            .init(title: "Электрик", name: "Кайрбек Серик", image: Asset.kairat.image, detail: "Ремонт выключателя, Ремонт автомата, Демонтаж люстры ....", price: "от 2 000 ₸"),
            .init(title: "Сантехник", name: "Руслан Николаев", image: Asset.ruslan.image, detail: "Ремонт выключателя, Ремонт автомата, Демонтаж люстры ....", price: "от 2 000 ₸"),
            .init(title: "Уборка по дому", name: "Сауле Кадыралиева", image: Asset.saule.image, detail: "Мойка окон, полов и холодильника Стирка грязных вещей и тд ...", price: "от 2 000 ₸")
        ]
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure() {
        homeRecommendations.forEach {
            let view = HomeRecommendationView.loadFromNib()
            view.configure(viewModel: $0)
            stackView.addArrangedSubview(view)
        }
    }
}
