//
//  OnboardingViewController.swift
//  Asar
//
//  Created by Бексултан Нурпейс on 15.04.2022.
//

import UIKit

class OnboardingViewController: UIViewController{

    @IBOutlet weak var PageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var SkipButton: UIButton!
    
    let OnboardingCollectionViewCellId = "OnboardingCollectionViewCell"
    
    var slides: [OnboardingSlides] = []
    
    var currentPage = 0
    {
        didSet{
            PageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextButton.setTitle("Начать работу", for: .normal)
            }else{
                nextButton.setTitle("Следующая", for: .normal)
            }
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibCell = UINib(nibName: OnboardingCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: OnboardingCollectionViewCellId)
        
        slides = [
            OnboardingSlides(title: "Заказ в один клик",
                             description: "Они автоматически подстраивают межбуквенное расстояние и высоту шрифта",
                             image: UIImage(named: "rect")!),
            OnboardingSlides(title: "Заказ в один клик",
                             description: "Они автоматически подстраивают межбуквенное расстояние и высоту шрифта",
                             image: UIImage(named: "rect")!),
            OnboardingSlides(title: "Заказ в один клик",
                             description: "Они автоматически подстраивают межбуквенное расстояние и высоту шрифта",
                             image: UIImage(named: "rect")!)
        ]
    }
    
   
    
 

    @IBAction func nextButtonClick(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            print("go to the next page")
        }else{
            currentPage += 1
            collectionView.isPagingEnabled  = false
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.reloadData()
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
          
        }
        collectionView.isPagingEnabled  = true
    }
    
    @IBAction func skipButtonClic(_ sender: UIButton) {
        print("next page")
    }
}


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCellId, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
}
